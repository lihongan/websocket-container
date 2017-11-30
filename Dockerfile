FROM ubuntu:17.04
 
MAINTAINER Hongan Li "hongli@redhat.com"
 
ENV REFRESHED_AT 2017-11-30
 
RUN apt-get update
RUN apt-get install -y nodejs
 
# needs this to find the nodejs exec
RUN ln -s /usr/bin/nodejs /usr/bin/node
 
RUN apt-get install -y npm
RUN /usr/bin/npm install ws
RUN /usr/bin/npm install node-static

COPY server.js /root/server.js
COPY index.html /root/index.html

EXPOSE 8080
EXPOSE 80
 
ENTRYPOINT ["/usr/bin/node", "/root/server.js"]
