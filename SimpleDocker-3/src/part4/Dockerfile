FROM nginx:latest
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev
COPY hello.c /etc
COPY nginx.conf /etc/nginx
RUN gcc /etc/hello.c -o /etc/hello -lfcgi
CMD spawn-fcgi -p 8080 /etc/hello && nginx -g "daemon off;" && nginx -s reload