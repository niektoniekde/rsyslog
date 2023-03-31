#! /bin/bash
set -eux

LETCD="/usr/local/etc/rsyslog"
CONFD="${LETCD}/conf.d"
DATAD="/srv/data/rsyslog"

if ! [[ -n $(ls -1A ${CONFD}) ]]; then
    echo "ERROR: there are no configuration files to be included in directory: '${CONFD}' " >&2
    exit 100
fi

if ! [[ -d ${DATAD} ]]; then mkdir -p "${DATAD}"; fi
chmod ug=rwX,o-rX -R "${DATAD}"

exec /usr/sbin/rsyslogd -n -f "${LETCD}/rsyslog.conf"
