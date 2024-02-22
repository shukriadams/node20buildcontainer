# note, we have to build as root user because the build process will very likely require us to install
# packages as root to this container

FROM alpine:3.19

RUN apk update &&\
    apk upgrade &&\
    apk add git &&\
    apk add bash &&\
    apk add rsync &&\
    apk add sshpass=1.10-r0 &&\
    apk add curl ca-certificates openssh &&\
    apk add nodejs=20.11.1-r0 &&\
    apk add npm=10.2.5-r0 &&\
    npm install yarn@1.17.3 -g &&\
    npm install webpack@4.39.1 -g &&\
    npm install webpack-cli@3.3.6 -g &&\
    npm install minify@5.1.1 -g &&\
    npm install jspm@0.16x -g &&\
    npm install uglify-es@3.3.9 -g &&\
    npm install concat-cli@4.0.0 -g &&\
    npm install typescript@3.5.3 -g &&\
    npm install tslint@5.18.0 -g &&\
    npm install nyc@15.1.0 -g &&\
    npm install pkg@5.1.0 -g &&\
    mkdir -p /usr/keys &&\
    mkdir -p /usr/build 

WORKDIR /usr/build

# fix key permissions on start
CMD ["/bin/sh", "-c", "chmod 700 -R /usr/keys"]
