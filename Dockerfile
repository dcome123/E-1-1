FROM nginx:alpine

LABEL org.opencontainers.image.title="my-custom-nginx" \
      org.opencontainers.image.description="Codyssey mission 1 custom web server"

ENV APP_ENV=dev

COPY site/ /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1
