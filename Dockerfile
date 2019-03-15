FROM azul/zulu-openjdk-alpine:8

MAINTAINER DongHee Kim <terdong@gmail.com>

RUN apk update

ENV SBT_HOME /usr/local/sbt
ENV SBT_VERSION 1.2.8
ENV SBT_URL https://piccolo.link/sbt-${SBT_VERSION}.tgz

ENV PATH ${PATH}:${SBT_HOME}/bin
ENV INSTALL_DIR /usr/local

# Install sbt
RUN apk add --no-cache bash wget && mkdir -p "$SBT_HOME" 
RUN wget -qO - --no-check-certificate "$SBT_URL" | tar xz -C $INSTALL_DIR
RUN echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built


# Install git
RUN apk add --no-cache git openssh
