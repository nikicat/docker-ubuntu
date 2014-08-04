#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM racker/precise-with-updates

# Install basic packages.
RUN sed -i 's|://.*\..*\.com|://ru.archive.ubuntu.com|' /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python-software-properties software-properties-common curl git htop unzip vim wget build-essential tmux bash-completion && apt-get clean

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/scripts /root/scripts
ADD root/.m2/settings.xml /root/.m2/settings.xml

# Set working directory.
ENV HOME /root
ENV LC_ALL C.UTF-8
WORKDIR /root
