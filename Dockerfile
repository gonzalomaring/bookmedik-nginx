FROM nginx
MAINTAINER Gonzalo Marin "gonzalomaringomez@gmail.com"
RUN apt update && apt upgrade -y && apt install mariadb-client -y && apt clean && rm -rf /var/lib/apt/lists/*
ADD default.conf /etc/nginx/conf.d/
ADD bookmedik /usr/share/nginx/html
ADD script.sh /opt/
RUN chmod +x /opt/script.sh && rm /usr/share/nginx/html/index.html
ENTRYPOINT ["/opt/script.sh"]
