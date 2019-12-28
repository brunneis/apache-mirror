FROM brunneis/httpd
RUN \
    yum -y install rsync \
    && yum clean all
COPY entrypoint.sh /usr/bin/
COPY httpd.conf /opt/httpd/conf/httpd.conf
ENTRYPOINT entrypoint.sh