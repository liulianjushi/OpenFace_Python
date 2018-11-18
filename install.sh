#!/bin/bash
#==============================================================================
# Title: install.sh
# Description: Install everything necessary for OpenFace to compile.
# Author: Daniyal Shahrokhian <daniyal@kth.se>
# Date: 20170428
# Version : 1.02
# Usage: bash install.sh
# NOTES: There are certain steps to be taken in the system before installing 
#        via this script (refer to README): Run 
#        `sudo gedit /etc/apt/sources.list` and change the line 
#        `deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted` to 
#        `deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe`
#==============================================================================

# Exit script if any command fails
set -e 
set -o pipefail

if [ $# -ne 0 ]
  then
    echo "Usage: install.sh"
    exit 1
fi

# Essential Dependencies
echo "Installing Essential dependencies..."
apt-get -y update
apt-get -y install build-essential
apt-get -y install cmake
apt-get -y install libopenblas-dev liblapack-dev
apt-get -y install git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
apt-get -y install wget unzip libpcre3 libpcre3-dev swig
echo "Essential dependencies installed."
# OpenCV Dependency
echo "Downloading OpenCV..."
wget https://github.com/opencv/opencv/archive/3.4.0.zip
unzip 3.4.0.zip
cd opencv-3.4.0
mkdir -p build
cd build
echo "Installing OpenCV..."
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_CUDA=OFF -D BUILD_SHARED_LIBS=ON ..
make -j4
make install
cd ../..
rm 3.4.0.zip
rm -r opencv-3.4.0
echo "OpenCV installed."

# dlib dependecy
echo "Downloading dlib"
wget http://dlib.net/files/dlib-19.13.tar.bz2;
tar xf dlib-19.13.tar.bz2;
cd dlib-19.13;
mkdir -p build;
cd build;
echo "Installing dlib"
# cmake ..;
# cmake --build . --config Release;
cmake -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_SHARED_LIBS=ON ..
make install;
ldconfig;
cd ../..;    
rm -r dlib-19.13.tar.bz2
echo "dlib installed"

# Boost C++ Dependency
echo "Installing Boost..."
apt-get install libboost-all-dev
echo "Boost installed."

# OpenFace installation
echo "Installing OpenFace..."
mkdir -p build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE ..
make
cd ..
echo "OpenFace successfully installed."
