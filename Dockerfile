#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM racker/precise-with-updates

# Install basic packages.
RUN sed -i 's/mirror.rackspace.com/archive.ubuntu.com/' /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-software-properties curl git htop unzip vim wget build-essential tmux bash-completion

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/scripts /root/scripts

# Set working directory.
ENV HOME /root
WORKDIR /root
