FROM ubuntu:latest

ENV PIWIK_VERSION 2.10.0

RUN apt-get update && apt-get install -y \
  curl \
  apache2 \
  libapache2-mod-php5 \
  php5-gd \
  php5-mysql \
  php5-curl \
  php5-cli \
  php5-geoip

ADD entrypoint.sh /usr/local/sbin/
ADD piwik.conf /etc/apache2/sites-available/

RUN a2dissite 000-default
RUN a2ensite piwik

VOLUME /srv/piwik
EXPOSE 80
ENTRYPOINT ["entrypoint.sh"]
CMD ["piwik"]
