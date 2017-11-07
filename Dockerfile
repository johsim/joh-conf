FROM ubuntu:xenial

RUN apt-get update && apt-get -y install sudo

# Adds user test and set passwd to "test"
RUN useradd -m test && echo "test:test" | chpasswd && adduser test sudo

USER test
WORKDIR /home/test
ENTRYPOINT ["/bin/bash"]
