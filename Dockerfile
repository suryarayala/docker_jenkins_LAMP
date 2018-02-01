FROM centos:6
MAINTAINER Teja <teja_ja@gmail.com>
#set the proxy
RUN export http_proxy=http://10.10.17.17:3128
RUN export https_proxy=http://10.10.17.17:3128
RUN export ftp_proxy=http://10.10.17.17:3128
#installing required packages
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y python-pip && pip install pip>=1.4,<1.5 --upgrade
RUN pip install supervisor
RUN yum install -y openssh-server openssh-client
RUN yum install -y passwd httpd mysql mysql-server
RUN yum install -y php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml
# replacing my config file and starting required services
ADD ./supervisord.conf /etc/supervisord.conf
RUN service mysqld start
EXPOSE 22 80 3306
CMD [/usr/bin/supervisord]
