FIND_PACKAGE(SWIG REQUIRED)
FIND_PACKAGE(PythonLibs)

INCLUDE(${SWIG_USE_FILE})
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})

#Utilities library
include_directories(../../local/Utilities/include)
include_directories(../../local/LandmarkDetector/include)
include_directories(../../3rdParty/OpenCV3.4/include)
SET(SOURCE
    src/CCNF_patch_expert.cpp
	src/CEN_patch_expert.cpp
	src/CNN_utils.cpp
	src/FaceDetectorMTCNN.cpp
	src/LandmarkDetectionValidator.cpp
    src/LandmarkDetectorFunc.cpp
	src/LandmarkDetectorModel.cpp
    src/LandmarkDetectorUtils.cpp
	src/LandmarkDetectorParameters.cpp
	src/Patch_experts.cpp
	src/PAW.cpp
    src/PDM.cpp
	src/SVR_patch_expert.cpp
	src/stdafx.cpp
	src/FaceAnalyser.cpp
	src/FaceAnalyserParameters.cpp
	src/Face_utils.cpp
	src/GazeEstimation.cpp
	src/SVM_dynamic_lin.cpp
	src/SVM_static_lin.cpp
	src/SVR_dynamic_lin_regressors.cpp
	src/SVR_static_lin_regressors.cpp
)

SET(HEADERS
    include/CCNF_patch_expert.h	
	include/CEN_patch_expert.h
    include/CNN_utils.h
	include/FaceDetectorMTCNN.h
    include/LandmarkCoreIncludes.h
	include/LandmarkDetectionValidator.h
    include/LandmarkDetectorFunc.h
	include/LandmarkDetectorModel.h
	include/LandmarkDetectorParameters.h
	include/LandmarkDetectorUtils.h
	include/Patch_experts.h	
    include/PAW.h
	include/PDM.h
	include/SVR_patch_expert.h		
	include/stdafx.h
	include/FaceAnalyser.h
	include/FaceAnalyserParameters.h
	include/Face_utils.h
	include/GazeEstimation.h
	include/SVM_dynamic_lin.h
	include/SVM_static_lin.h
	include/SVR_dynamic_lin_regressors.h
	include/SVR_static_lin_regressors.h
)

add_library( LandmarkDetector SHARED ${SOURCE} ${HEADERS} )
add_library( OpenFace::LandmarkDetector ALIAS LandmarkDetector)

target_include_directories(LandmarkDetector PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:$<INSTALL_PREFIX>/include/OpenFace>)

target_include_directories(LandmarkDetector PRIVATE ${LandmarkDetector_SOURCE_DIR}/include)
target_include_directories(LandmarkDetector PUBLIC ${TBB_ROOT_DIR}/include)
target_include_directories(LandmarkDetector PUBLIC ${Boost_INCLUDE_DIRS})
target_include_directories(LandmarkDetector PUBLIC ${Boost_INCLUDE_DIRS}/boost)
target_include_directories(LandmarkDetector PUBLIC ${OpenCV_INCLUDE_DIRS})
target_include_directories(LandmarkDetector PRIVATE ${OpenBLAS_INCLUDE_DIR})

message(${OpenCV_INCLUDE_DIRS})
target_link_libraries(LandmarkDetector PUBLIC ${OpenCV_LIBS} ${Boost_LIBRARIES} ${TBB_LIBRARIES} ${OpenBLAS_LIB})
target_link_libraries(LandmarkDetector PUBLIC dlib::dlib)

target_include_directories(LandmarkDetector PRIVATE ${OpenBLAS_INCLUDE_DIR})
include_directories(${OpenBLAS_INCLUDE_DIR})

set(CMAKE_SWIG_OUTDIR ${CMAKE_BINARY_DIR}/bin)
SET_SOURCE_FILES_PROPERTIES(landmarkDetector.i PROPERTIES CPLUSPLUS ON)
SWIG_ADD_MODULE(landmarkDetector python landmarkDetector.i)
SWIG_LINK_LIBRARIES(landmarkDetector LandmarkDetector ${PYTHON_LIBRARIES})


install (TARGETS LandmarkDetector EXPORT OpenFaceTargets LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
install (FILES ${HEADERS} DESTINATION include/OpenFace)
