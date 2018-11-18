/* Copyright (c) 2015-2018 The OpenCV-SWIG Library Developers. See the AUTHORS file at the
 * top-level directory of this distribution and at
 * https://github.com/renatoGarcia/opencv-swig/blob/master/AUTHORS.
 *
 * This file is part of OpenCV-SWIG Library. It is subject to the 3-clause BSD license
 * terms as in the LICENSE file found in the top-level directory of this distribution and
 * at https://github.com/renatoGarcia/opencv-swig/blob/master/LICENSE. No part of
 * OpenCV-SWIG Library, including this file, may be copied, modified, propagated, or
 * distributed except according to the terms contained in the LICENSE file.
 */

%include <opencv2/core/version.hpp>

#if CV_MAJOR_VERSION > 3
    %warn "900:Using an unsupported OpenCV version."
    %include <opencv/detail/point3-3_0_0.i>
#elif CV_MAJOR_VERSION == 3 && CV_MINOR_VERSION > 4
    %warn "900:Using an unsupported OpenCV version."
    %include <opencv/detail/point3-3_0_0.i>
#else
    %include <opencv/detail/point3-3_0_0.i>
#endif
