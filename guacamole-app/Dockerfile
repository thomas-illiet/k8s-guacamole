FROM guacamole/guacamole:1.1.0
LABEL MAINTAINER scott.macgregor@d2iq.com
COPY branding.jar /root/.guacamole/extensions/

WORKDIR /opt/guacamole
EXPOSE 8080
CMD ["/opt/guacamole/bin/start.sh" ]