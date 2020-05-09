FROM nginx:alpine
MAINTAINER Sheng Chen 

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

