# VERSION 0.2
# DOCKER-VERSION 0.3.4
# To build:
# 1. Install docker (http://docker.io)
# 2. Checkout source: git@github.com:gasi/docker-node-hello.git
# 3. Build container: docker build .

FROM    centos:centos6

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y -q npm

# App
ADD . /src
# Install app dependencies
RUN cd /src; npm install

RUN curl -L -o /tmp/containerbuddy.tar.gz https://github.com/joyent/containerbuddy/releases/download/0.1.3/containerbuddy-0.1.3.tar.gz \
&& cd /tmp  \
&& tar xzfv containerbuddy.tar.gz \
&& mv containerbuddy /bin/containerbuddy \
&& rm containerbuddy.tar.gz

ADD containerbuddy/ /opt/containerbuddy/
ENV CONTAINERBUDDY_CONFIG=file:///opt/containerbuddy/app.json

EXPOSE  8080
CMD containerbuddy -config ${CONTAINERBUDDY_CONFIG} node /src/index.js
