FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
      locales ca-certificates curl gnupg2 dirmngr lsb-release \
      software-properties-common \
 && locale-gen en_US en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN add-apt-repository universe

SHELL ["/bin/bash", "-c"]
RUN set -euxo pipefail; \
    apt-get update; \
    apt-get install -y --no-install-recommends curl; \
    ROS_APT_SOURCE_VERSION="$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F 'tag_name' | awk -F\\\" '{print $4}')" ; \
    UBUNTU_CODENAME="$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})"; \
    curl -L -o /tmp/ros2-apt-source.deb \
      "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.${UBUNTU_CODENAME}_all.deb"; \
    dpkg -i /tmp/ros2-apt-source.deb; \
    rm -f /tmp/ros2-apt-source.deb

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
      ros-jazzy-desktop \
      ros-dev-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/jazzy/setup.bash" >> /etc/bash.bashrc

CMD ["/bin/bash"]
