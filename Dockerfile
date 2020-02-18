FROM docker:dind

ENV PGID=0 \
    PUID=0

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz /tmp
RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C / && \
    mkdir -p /app /notebooks

RUN mkdir /_docker && \
    cp -r /var/lib/docker/ /_docker/


EXPOSE 80
WORKDIR /notebooks
VOLUME /var/lib/docker /notebooks


ADD https://github.com/netgusto/nodebook/releases/download/0.2.0/nodebook-linux /app/
RUN chmod +x /app/nodebook-linux


COPY services.d/ /etc/services.d/
COPY cont-init.d/ /etc/cont-init.d/
ENTRYPOINT ["/init"]
