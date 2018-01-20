# DOCKER-VERSION 0.3.4
FROM        perl:latest
MAINTAINER  Robert Norris rob@eatenbyagrue.org

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starman

RUN cachebuster=b953b35 git clone http://github.com/robn/towncrier.git
RUN cd towncrier && carton install --deployment

EXPOSE 8080

WORKDIR towncrier
CMD carton exec starman --port 8080 bin/app.pl

