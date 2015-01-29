FROM ubuntu:trusty
MAINTAINER Feng Honglin <tifayuki@gmail.com>

RUN apt-get update && \
    apt-get install -y build-essential golang git mercurial && \
    mkdir -p /release

ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV COMMON_NAME *

CMD ["/run.sh"]

