%module landmarkDetector
%begin %{
#include "stdafx.h"
%}

%{
#define SWIG_FILE_WITH_INIT
#include "CCNF_patch_expert.h"
#include "CEN_patch_expert.h"
#include "CNN_utils.h"
#include "FaceDetectorMTCNN.h"
#include "LandmarkCoreIncludes.h"
#include "LandmarkDetectionValidator.h"
#include "LandmarkDetectorFunc.h"
#include "LandmarkDetectorModel.h"
#include "LandmarkDetectorParameters.h"
#include "LandmarkDetectorUtils.h"
#include "PAW.h"
#include "PDM.h"
#include "SVR_patch_expert.h"

#include "Face_utils.h"
#include "FaceAnalyser.h"
#include "FaceAnalyserParameters.h"
#include "SVM_dynamic_lin.h"
#include "SVM_static_lin.h"
#include "SVR_dynamic_lin_regressors.h"
#include "SVR_static_lin_regressors.h"

#include "GazeEstimation.h"
%}



%include "std_pair.i"
%include <typemaps.i>
%apply int &INPUT  { int &num_hog_rows, int *num_hog_cols};



%include "opencv.i"

// Instantiate templates used
namespace std {
   %template(StringVector) std::vector<std::string>;
   %template(PairDoulbeVector) std::vector<std::pair<std::string, double> >;
   %template(DoublePair) std::pair<std::string, double>;
   %template(FloatRectVector) std::vector<cv::Rect_<float> >;
}


namespace cv
{

  %template(Rect2f) cv::Rect_<float>;
  %template(Rect2d) cv::Rect_<double>;
  %template(Mat2uchar) cv::Mat_<uchar>;
  %template(Mat2f) cv::Mat_<float>;
  %template(Mat2d) cv::Mat_<double>;
  %template(Mat2i) cv::Mat_<int>;
  %template(Point3f) cv::Point3_<float>;
  
}

%include "CCNF_patch_expert.h"
%include "CEN_patch_expert.h"
%include "CNN_utils.h"
%include "FaceDetectorMTCNN.h"
%include "LandmarkCoreIncludes.h"
%include "LandmarkDetectionValidator.h"
%include "LandmarkDetectorFunc.h"
%include "LandmarkDetectorUtils.h"
%include "PAW.h"
%include "PDM.h"
%include "SVR_patch_expert.h"
%include "stdafx.h"
%include "LandmarkDetectorModel.h"
%include "LandmarkDetectorParameters.h"

%include "Face_utils.h"
%include "FaceAnalyser.h"
%include "FaceAnalyserParameters.h"
%include "SVM_dynamic_lin.h"
%include "SVM_static_lin.h"
%include "SVR_dynamic_lin_regressors.h"
%include "SVR_static_lin_regressors.h"

%include "GazeEstimation.h"




