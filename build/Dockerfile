FROM phusion/passenger-ruby19:0.9.14
MAINTAINER Goffert van Gool "goffert@phusion.nl"

# Force non-interactive installs
ENV DEBIAN_FRONTEND noninteractive

# Install libraries
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends libmysqlclient-dev mysql-client imagemagick pngquant && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add nginx as a service
RUN rm -f /etc/service/nginx/down

# Link to the mounted config file
RUN ln -sf /rook/persist/config/nginx.conf /etc/nginx/nginx.conf

# Add templates for configuration files
ADD templates /tmp/templates
RUN chown -R app:app /tmp/templates

# Add our init scripts
ADD scripts /rook/scripts

# Use the init wrapper. This will start the init process once all init scripts are completed
CMD ["/rook/scripts/rook_init"]
