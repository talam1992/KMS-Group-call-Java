FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt install apt-utils -y
RUN apt install maven -y
RUN apt install openjdk-8-jdk openjdk-8-jre -y
RUN apt-get install software-properties-common -y
RUN git clone https://github.com/talam1992/KMS-Group-call-Java
WORKDIR kurento-tutorial-java/kurento-group-call/

EXPOSE 8080

ENTRYPOINT mvn -U clean spring-boot:run -Dkms.url=ws://172.17.0.1:8888/kurento
