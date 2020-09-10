#Download base image ubuntu 18.04
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
 
# Update Software repository
RUN apt-get update -y --no-install-recommends

# Upgrade Software
RUN apt-get upgrade -y --no-install-recommends

# Install the required packages
RUN apt-get install nano wget curl nginx supervisor -y --no-install-recommends

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

# Setup supervisor
RUN mkdir -p /var/log/supervisor
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install php extentions

# Copy scripts
COPY scripts /scripts
RUN chmod +x -R /scripts
RUN /scripts/install.sh

ENV DEBIAN_FRONTEND teletype

WORKDIR /var/www/html

EXPOSE 80 443
CMD ["/scripts/start.sh"]