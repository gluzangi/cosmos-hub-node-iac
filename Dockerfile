FROM jrei/systemd-ubuntu:18.04

ENV PYTHONIOENCODING=utf8
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update \
  && apt-get install -y \
  python3-pip \
  curl \
  locales \
  wget \
  sudo \
  && apt-get autoremove \
  && apt-get clean

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

ADD requirements.txt /tmp/

RUN pip3 install -r /tmp/requirements.txt

RUN useradd -m -s /bin/bash -G sudo figment

WORKDIR /tmp/ansible
