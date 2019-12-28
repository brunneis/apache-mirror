FROM brunneis/httpd
RUN \
    yum -y install rsync \
    && yum clean all \
    && awk -v n=1 '/AllowOverride None/ { if (++count == n) sub(/None/, "All"); } 1' \
        /opt/httpd/conf/httpd.conf > aux && mv -f aux /opt/httpd/conf/httpd.conf
COPY entrypoint.sh /usr/bin/
ENTRYPOINT entrypoint.sh