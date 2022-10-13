FROM docker.io/alpine:latest

# install rsyslog and bash packages
RUN apk --no-cache add rsyslog bash

# prepare local configuration structure
RUN mkdir -p /usr/local/etc/rsyslog/conf.d
COPY conf/rsyslog.conf /usr/local/etc/rsyslog/rsyslog.conf
RUN chown -R root: /usr/local/etc/rsyslog
RUN chmod -R u=rwX,go=rX /usr/local/etc/rsyslog

# prepare data volume mountpoint
RUN mkdir -p /srv/data
RUN chown -R root: /srv/data
RUN chmod -R u=rwX,go=rX /srv/data

# volumes declarations
VOLUME /usr/local/etc/rsyslog/conf.d
VOLUME /srv/data

# prepare entrypoint
COPY entrypoint.bash /usr/local/bin/entrypoint.bash
RUN chmod u=rwx,go=rx /usr/local/bin/entrypoint.bash

ENTRYPOINT ["/usr/local/bin/entrypoint.bash"]
