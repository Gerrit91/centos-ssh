FROM centos:7
RUN yum install -y openssh-server \
 && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
 && echo "root:password" | chpasswd \
 && yum clean all \
 && rm -fr /var/cache/yum
COPY entrypoint.sh /

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
