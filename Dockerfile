# Dockerfile

FROM nginx:stable-alpine

# Копируем конфиги и сайт
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./html/ /usr/share/nginx/html/

# Копируем wait-for-db внутрь контейнера
COPY wait-for-db.sh /wait-for-db.sh
RUN chmod +x /wait-for-db.sh

# Заменим CMD, чтобы ждать PostgreSQL перед стартом nginx
CMD ["/wait-for-db.sh", "db:5432", "--", "nginx", "-g", "daemon off;"]
