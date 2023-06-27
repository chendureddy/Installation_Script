FROM ubuntu:latest
MAINTAINER chendureddy1999@gmail.com
RUN apt-get update 
RUN apt-get -y install apache2 
RUN apt-get install unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
ENTRYPOINT apachectl -D FOREGROUND
EXPOSE 80
