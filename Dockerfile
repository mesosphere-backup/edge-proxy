FROM       alpine
MAINTAINER Mesosphere <team@mesosphere.com>
EXPOSE     80

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" \
     >> /etc/apk/repositories \
    && apk -U add tengine@testing

ADD config /config
ENTRYPOINT [ "/config/run" ]
