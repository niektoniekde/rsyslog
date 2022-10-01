# Description
Image based on official Alpine Linux image with ``rsyslog`` installed via apk.
Entrypoint is ``rsyslogd`` executable with following arguments:
* ``-n`` - so main process won't fork
* ``-f /usr/local/etc/rsyslog/rsyslog.conf`` - custom **default** configuration file

## Configuration
Custom default configuration file provided as parameter to ``rsyslogd`` is very similar
to original one from alpine repository but some rules and modules are removed.

Additional configuration is expected as optional from volume mounted at:  
``/usr/local/etc/rsyslog/conf.d``

## Volumes
There are two volumes by default, one for configuration files and one for data:
* ``/usr/local/etc/rsyslog/conf.d`` - configuration files
* ``/srv/data`` - data
