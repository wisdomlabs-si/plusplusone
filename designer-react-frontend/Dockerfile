FROM nginx:1.21

RUN apt-get update && apt-get install -y dos2unix

RUN rm -rf /usr/share/nginx/html/*
ENV API_GRAPH_DESIGNER_SERVICE=http://127.0.0.1:8989/

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/mime.types /etc/nginx/mime.types
COPY dist /usr/share/nginx/html/designer
COPY dist/index.html /usr/share/nginx/html/designer/index.orig.html

COPY conf/entrypoint.sh /entrypoint.sh
RUN dos2unix /entrypoint.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
