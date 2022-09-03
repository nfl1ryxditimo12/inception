FROM alpine:3.16

WORKDIR /usr/src/app

RUN apk add nginx
RUN mkdir html
RUN echo "<h1>hello nginx</h1>" >> ./html/index.html

COPY ./conf/server.conf /etc/nginx/http.d/default.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
