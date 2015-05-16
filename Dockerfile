# Use the trusty ubuntu as our base image
FROM ubuntu:trusty
MAINTAINER Nick Mele <nick@riversagile.com>

# Update packages and install tools
RUN apt-get update && apt-get install -y \
  openssh-server \
  git-core \
  openssh-client \
  curl \
  build-essential

# Install RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable

# Install RVM requirements
RUN /bin/bash -l -c "rvm requirements"

# Install Ruby 2.2.1
RUN /bin/bash -l -c "rvm install 2.2.1"

# Install bundler
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
