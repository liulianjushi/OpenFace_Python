%module utilities
%{
# define SWIG_PYTHON_EXTRA_NATIVE_CONTAINERS 
#include "ImageCapture.h"
#include "ImageManipulationHelpers.h"
#include "RecorderCSV.h"
#include "RecorderHOG.h"
#include "RecorderOpenFace.h"
#include "RecorderOpenFaceParameters.h"
#include "RotationHelpers.h"
#include "SequenceCapture.h"
#include "VisualizationUtils.h"
#include "Visualizer.h"
%}




%include "ImageCapture.h"
%include "ImageManipulationHelpers.h"
%include "RecorderCSV.h"
%include "RecorderHOG.h"
%include "RecorderOpenFace.h"
%include "RecorderOpenFaceParameters.h"
%include "RotationHelpers.h"
%include "SequenceCapture.h"
%include "VisualizationUtils.h"
%include "Visualizer.h"
