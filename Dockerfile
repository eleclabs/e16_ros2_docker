FROM ros:jazzy-ros-base
ENV DEBIAN_FRONTEND=noninteractive

# ---------------------------------------------------------
# ROS 2 Jazzy + Omni Robot Development Environment
# ---------------------------------------------------------
RUN apt-get update && apt-get install -y \
    # Desktop / Visualization
    ros-jazzy-desktop \
    ros-jazzy-rviz2 \
    \
    # Navigation2
    ros-jazzy-navigation2 \
    ros-jazzy-nav2-bringup \
    \
    # SLAM
    ros-jazzy-slam-toolbox \
    \
    # Robot Description
    ros-jazzy-xacro \
    ros-jazzy-robot-state-publisher \
    ros-jazzy-joint-state-publisher \
    ros-jazzy-joint-state-publisher-gui \
    \
    # TF
    ros-jazzy-tf2 \
    ros-jazzy-tf2-ros \
    ros-jazzy-tf2-tools \
    ros-jazzy-tf-transformations \
    \
    # ros2_control
    ros-jazzy-ros2-control \
    ros-jazzy-ros2-controllers \
    \
    # Joint / Controller
    ros-jazzy-joint-state-broadcaster \
    ros-jazzy-diff-drive-controller \
    \
    # CycloneDDS
    ros-jazzy-rmw-cyclonedds-cpp \
    \
    # Diagnostics
    ros-jazzy-diagnostic-updater \
    ros-jazzy-diagnostic-msgs \
    \
    # ROS Development
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \
    \
    # Development Tools
    git \
    nano \
    vim \
    curl \
    wget \
    iputils-ping \
    net-tools \
    usbutils \
    \
    && rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------
# Environment
# ---------------------------------------------------------
ENV ROS_DISTRO=jazzy
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
WORKDIR /ros2_ws

# ---------------------------------------------------------
# Bash configuration
# ---------------------------------------------------------
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc
RUN echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> /root/.bashrc
RUN echo 'if [ -f /ros2_ws/install/setup.bash ]; then source /ros2_ws/install/setup.bash; fi' >> /root/.bashrc

# ---------------------------------------------------------

CMD ["bash"]
