FROM docker.io/centos/nodejs-4-centos7
COPY ./oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm ./
USER root

RUN yum install -y  libaio && rpm -Uvh oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
USER 1001
