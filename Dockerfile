# nginx state for serving content
FROM nginx:alpine
# Set working directory to nginx asset directory
#WORKDIR .
# Remove default nginx static assets
#RUN rm -rf ./*
# Copy static assets over
#COPY ./src/index.html /usr/share/nginx/html
# set permissions
RUN apk add shadow && usermod -u 1000 /usr/share/nginx/html && groupmod -g 1000 /usr/share/nginx/html
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
