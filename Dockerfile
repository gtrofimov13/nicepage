# nginx state for serving content
FROM nginx:alpine
# Set working directory to nginx asset directory
#WORKDIR .
# Remove default nginx static assets
#RUN rm -rf ./*
# Copy static assets over
COPY ./src/* /usr/share/nginx/html
# set permissions
RUN chown nginx:nginx /usr/share/nginx/html/*
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
