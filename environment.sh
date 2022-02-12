#!/bin/bash

sudo apt update  
sudo apt -y upgrade  
sudo apt update  
sudo apt -y dist-upgrade  


cd ~/Downloads/
wget https://download.01.org/opencv/2020/openvinotoolkit/2020.3/l_openvino_toolkit_runtime_raspbian_p_2020.3.341.tgz
sudo mkdir -p /opt/intel/openvino
echo dearchive package
sudo tar -xf l_openvino_toolkit_runtime_raspbian_p_2020.3.341.tgz --strip 1 -C /opt/intel/openvino

cd ~
echo excute cmake
sudo apt install cmake -y
