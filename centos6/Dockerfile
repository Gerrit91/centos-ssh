FROM centos:6
RUN yum install -y python iproute openssl openssh-server \
 && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
 && echo "root:password" | chpasswd \
 && yum clean all \
 && rm -fr /var/cache/yum
COPY entrypoint.sh /

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
