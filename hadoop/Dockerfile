FROM debian:buster-slim

ADD entrypoint.sh /entrypoint.sh

# Users with other locales should set this in their derivative image
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Fix JAVA version and url
ARG JAVA_MAJOR_VERSION=8
ARG JAVA_UPDATE_VERSION=181
ARG JAVA_BUILD_NUMBER=13
ENV JAVA_HOME /usr/jdk1.${JAVA_MAJOR_VERSION}.0_${JAVA_UPDATE_VERSION}

ENV PATH $PATH:$JAVA_HOME/bin

# HADOOP
ENV HADOOP_VERSION 3.1.1
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV PATH $HADOOP_HOME/bin/:$PATH

RUN apt-get update \
 && apt-get install -y locales nano curl \
 && dpkg-reconfigure -f noninteractive locales \
 && locale-gen C.UTF-8 \
 && /usr/sbin/update-locale LANG=C.UTF-8 \
 && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
 && locale-gen \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && curl -L --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-b${JAVA_BUILD_NUMBER}/96a7b8442fe848ef90c96a2fad6ed6d1/server-jre-${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-linux-x64.tar.gz" \
  | gunzip \
  | tar x -C /usr/ \
 && ln -s $JAVA_HOME /usr/java \
 && rm -rf $JAVA_HOME/man \
 && curl -L --retry 3 "http://www-eu.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz" \
  | gunzip \
  | tar -x -C /opt/ \
 && rm -rf $HADOOP_HOME/share/doc \
 && ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
 && mkdir /opt/hadoop-$HADOOP_VERSION/logs \
 && mkdir /hadoop-data

ENV USER=root

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
