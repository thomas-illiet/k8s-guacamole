FROM registry.access.redhat.com/ubi8/ubi
#
# Container metadata section
#
LABEL MAINTAINER scott.macgregor@d2iq.com

#
# Runtime dependencies
#
COPY mariadb.repo /etc/yum.repos.d/

RUN mkdir -p /opt/schemas

COPY schema/1.1.0/001-create-schema.sql /opt/schemas/
COPY schema/1.1.0/002-create-admin-user.sql /opt/schemas/

RUN yum update -y && \
    yum install --nogpgcheck --disableplugin=subscription-manager -y ca-certificates \
    python36 \
    openssh-clients \
    wget \
    git \ 
    libaio \
    procps-ng && \
    yum clean all 

RUN yum install -y --disablerepo=ubi-8-appstream --disablerepo=ubi-8-baseos \
    MariaDB-client-10.5.3-1.el8.x86_64 && \
    yum clean all 

RUN set -ex && \
    groupadd --gid 1000 d2iq && \
    useradd --uid 1000 --gid d2iq --shell /bin/bash --create-home d2iq 

USER d2iq:d2iq

# mysql -h $MYSQL_HOSTNAME -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /opt/schemas/001-create-schema.sql

CMD ["sh", "-c", "/usr/bin/mysql -h ${MYSQL_HOSTNAME} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /opt/schemas/001-create-schema.sql && /usr/bin/mysql -h ${MYSQL_HOSTNAME} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /opt/schemas/002-create-admin-user.sql"]

