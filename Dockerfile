FROM debian:buster

RUN apt-get update && apt-get upgrade -y	\
&& apt-get -y install wget					\
&& apt-get -y install nginx					\
&& apt-get -y install php-mysql				\
