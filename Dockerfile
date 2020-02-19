FROM docker:dind

RUN mkdir /_install

ENV GID=0 \
    UID=0

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz /_install
RUN gunzip -c /_install/s6-overlay-amd64.tar.gz | tar -xf - -C / && \
    mkdir -p /app /notebooks
ENTRYPOINT ["/init"]


ADD https://github.com/netgusto/nodebook/releases/download/0.2.0/nodebook-linux /app/
RUN chmod +x /app/nodebook-linux


COPY docker/root /


EXPOSE 80
WORKDIR /notebooks
VOLUME /var/lib/docker /notebooks

RUN rm -r /_install
