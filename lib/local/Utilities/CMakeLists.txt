FIND_PACKAGE(SWIG REQUIRED)
FIND_PACKAGE(PythonLibs)

INCLUDE(${SWIG_USE_FILE})
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})


SET(SOURCE
    src/ImageCapture.cpp
	src/RecorderCSV.cpp
    src/RecorderHOG.cpp
	src/RecorderOpenFace.cpp
    src/RecorderOpenFaceParameters.cpp
	src/SequenceCapture.cpp
	src/VisualizationUtils.cpp
	src/Visualizer.cpp
)

SET(HEADERS
    include/ImageCapture.h	
    include/RecorderCSV.h
	include/RecorderHOG.h
    include/RecorderOpenFace.h
	include/RecorderOpenFaceParameters.h
	include/SequenceCapture.h
	include/VisualizationUtils.h
	include/Visualizer.h	
)

add_library( Utilities SHARED ${SOURCE} ${HEADERS})
add_library( OpenFace::Utilities ALIAS Utilities)

target_include_directories(Utilities PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:$<INSTALL_PREFIX>/include/OpenFace>)

target_include_directories(Utilities PRIVATE ${UTILITIES_SOURCE_DIR}/include)
target_include_directories(Utilities PUBLIC ${TBB_ROOT_DIR}/include)
target_include_directories(Utilities PUBLIC ${Boost_INCLUDE_DIRS})
target_include_directories(Utilities PUBLIC ${Boost_INCLUDE_DIRS}/boost)
target_include_directories(Utilities PUBLIC ${OpenCV_INCLUDE_DIRS})

target_link_libraries(Utilities PUBLIC ${OpenCV_LIBS} ${Boost_LIBRARIES} ${TBB_LIBRARIES})
target_link_libraries(Utilities PUBLIC dlib::dlib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

set(CMAKE_SWIG_OUTDIR ${CMAKE_BINARY_DIR}/bin/)
SET_SOURCE_FILES_PROPERTIES(utilities.i PROPERTIES CPLUSPLUS ON)
SWIG_ADD_MODULE(utilities python utilities.i)
SWIG_LINK_LIBRARIES(utilities Utilities ${PYTHON_LIBRARIES})

install (TARGETS Utilities EXPORT OpenFaceTargets LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
install (FILES ${HEADERS} DESTINATION include/OpenFace)
