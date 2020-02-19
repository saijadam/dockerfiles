FROM ubuntu

MAINTAINER saimtech@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O http://mirrors.standaloneinstaller.com/apache/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz 
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.50/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

RUN sudo yum update -y && yum install git -y

WORKDIR /opt/tomcat/webapps
RUN git clone https://github.com/saijadam/projCert.git 

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
