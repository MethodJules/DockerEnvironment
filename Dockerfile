FROM drupal:latest

RUN apt-get update && apt-get install -y \
	curl \
	git \
	mysql-client \
	vim \
	wget

#Install mysqli for civicrm installer
#RUN docker-php-ext-install mysqli

#Install nodejs
#RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
#RUN apt install -y nodejs
#RUN node --version
#RUN npm --version

#Install bower
#RUN npm install -g bower
#RUN echo '{ "allow_root": true }' > /root/.bowerrc

#Install composer
#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
#	php composer-setup.php && \
#	mv composer.phar /usr/local/bin/composer && \
#	php -r "unlink('composer-setup.php');"

#Install drush
RUN wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.4.2/drush.phar && \
	chmod +x drush.phar && \
	mv drush.phar /usr/local/bin/drush

RUN rm -rf /var/www/html/*

COPY apache-drupal.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /app
