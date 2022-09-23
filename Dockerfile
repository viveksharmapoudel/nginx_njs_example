FROM ubuntu:20.04

RUN apt-get update

RUN apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring

RUN curl https://nginx.org/keys/nginx_signing.key | \
    gpg --dearmor | \
    tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
         http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | \
         tee /etc/apt/sources.list.d/nginx.list

RUN apt-get update

RUN apt-get install -y nginx nginx-module-njs

COPY nginx.conf /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf

ADD conf.d /etc/nginx/conf.d

ADD njs /etc/nginx/njs

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

ENTRYPOINT [ "nginx" , "-g" , "daemon off;" ] 


