# Description
Image based on official Alpine Linux image with ``rsyslog`` installed via apk.
Entrypoint is ``rsyslogd`` executable with following arguments:
* ``-n`` - so main process won't fork
* ``-f /usr/local/etc/rsyslog/rsyslog.conf`` - custom **basic** configuration file

## Configuration
Custom basic configuration file provided as parameter to ``rsyslogd`` is stripped
version of original one located at ``/etc/rsyslog.conf``.

Additional configuration is expected as **optional** from volume mounted at:  
``/usr/local/etc/rsyslog/conf.d``  
Files placed there have to match ``*.conf`` naming pattern to be included. 

## Volumes
There are two volumes by default, one for configuration files and one for data:
* ``/usr/local/etc/rsyslog/conf.d`` - configuration files
* ``/srv/data`` - data
