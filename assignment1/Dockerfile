FROM centos:centos6
MAINTAINER Ashish
 
#Helpful utils, but only sudo is required
RUN yum -y install tar
RUN yum -y install wget
#RUN yum -y install vim
#RUN yum -y install nc
RUN yum -y install sudo
RUN yum -y install epel-release; yum clean all
RUN yum -y install mongodb-server; yum clean all
RUN mkdir -p /data/db
 
######## JDK7
 
#Note that ADD uncompresses this tarball automatically
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"
RUN tar xzf jdk-7u79-linux-x64.tar.gz
RUN mv jdk1.7.0_79/ /opt
WORKDIR /opt/jdk1.7.0_79
RUN alternatives --install /usr/bin/java java /opt/jdk1.7.0_79/bin/java 2
RUN alternatives --install /usr/bin/jar jar /opt/jdk1.7.0_79/bin/jar 2
RUN alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_79/bin/javac 2
RUN alternatives --set jar /opt/jdk1.7.0_79/bin/jar
RUN alternatives --set javac /opt/jdk1.7.0_79/bin/javac
RUN echo "JAVA_HOME=/opt/jdk1.7.0_79" >> /etc/environment
 
######## TOMCAT
 
#Note that ADD uncompresses this tarball automatically
RUN wget http://apache.mirrors.pair.com/tomcat/tomcat-7/v7.0.73/bin/apache-tomcat-7.0.73.tar.gz
RUN tar xvf apache-tomcat-7.0.73.tar.gz
RUN mv apache-tomcat-7.0.73 /usr/share
WORKDIR /usr/share/
RUN mv apache-tomcat-7.0.73/ tomcat7
RUN echo "JAVA_HOME=/opt/jdk1.7.0_79/" >> /etc/default/tomcat7
RUN groupadd tomcat
RUN useradd -s /bin/bash -g tomcat tomcat
RUN chown -Rf tomcat.tomcat /usr/share/tomcat7
EXPOSE 8080
#RUN su tomcat
ADD ./run.sh /usr/local/bin/run
CMD ["/usr/local/bin/run"]
