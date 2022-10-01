FROM docker.io/alpine:3.16
RUN apk --no-cache add rsyslog
RUN mkdir -p /usr/local/etc/rsyslog/conf.d
COPY conf/rsyslog.conf /usr/local/etc/rsyslog/rsyslog.conf
RUN chown -R root: /usr/local/etc/rsyslog
RUN chmod -R u=rwX,go=rX /usr/local/etc/rsyslog 
RUN mkdir -p /srv/data
RUN chown -R root: /srv/data
RUN chmod -R u=rwX,go=rX /srv/data
VOLUME /usr/local/etc/rsyslog/conf.d
VOLUME /srv/data
ENTRYPOINT ["/usr/sbin/rsyslogd", "-n", "-f", "/usr/local/etc/rsyslog/rsyslog.conf"]
