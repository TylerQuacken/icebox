#!/bin/bash

if [ $USER = root ]
then
    echo 'Do ./lab_install.sh and NOT sudo ./lab_install.sh'
    exit
fi

sudo apt-get update

sudo apt-get -y install vlc emacs ssh gimp tree ipython3 python3-pip vim fortune-mod gdb build-essential python3-matplotlib python3-catkin-tools

#things that are more up-to-date on pip
pip3 install scipy

#git stuff
git config --global core.editor emacs #NOTE: change this if you are anti-emacs
git config --global color.ui True
git config --global push.default simple

#python3 stuff
sudo apt install python-is-python3

#ROS INSTALLATION
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt install -y ros-noetic-desktop-full
sudo apt-get install -y python3-rosdep


sudo rosdep init 
rosdep update  
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "alias l='fortune | cowsay'" >> ~/.bashrc
echo "alias dc='tree ~/ | lolcat'" >> ~/.bashrc
source ~/.bashrc

# I needed the next line to install on wsl2
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
