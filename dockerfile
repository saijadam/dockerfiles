FROM ubuntu

MAINTAINER saimtech@gmail.com

RUN apt-get update && apt-get install curl -y 

RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat

RUN curl -O http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51.tar.gz -H 'Cache-Control: no-cache' 
RUN tar -xzvf apache*.tar.gz
RUN mv apache*/* /opt/tomcat/.

RUN apt-get install openjdk-8-jre -y
RUN java -version

RUN apt-get install git -y

WORKDIR /opt/tomcat/webapps

RUN git clone https://github.com/saijadam/projCert.git 

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
