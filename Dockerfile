FROM nginx
LABEL version="1.0" maintainer="Frederico E. Chaves <frederico.chaves@gmail.com>"
COPY static /app/static
COPY cgi-bin /app/cgi-bin
COPY ./fcgiwrap/sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install spawn-fcgi fcgiwrap -y
COPY ./nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
