# syntax=docker/dockerfile:1
FROM php:8.1-apache
ENV PHP_MEMORY_LIMIT=3000M
RUN apt update \                                                                                                                                                                                                                        
  && apt install -y ca-certificates wget \                                                                                                                                                                                                    
  && update-ca-certificates
RUN sed -i '/SSLCertificateFile.*snakeoil\.pem/c\SSLCertificateFile \/etc\/ssl\/certs\/projectcert.crt' /etc/apache2/sites-available/default-ssl.conf && sed -i '/SSLCertificateKeyFile.*snakeoil\.key/cSSLCertificateKeyFile /etc/ssl/private/projectcert.key\' /etc/apache2/sites-available/default-ssl.conf
RUN a2ensite default-ssl
RUN docker-php-ext-install mysqli \
  && docker-php-ext-install pdo_mysql \
  && a2enmod rewrite \
  && service apache2 restart
EXPOSE 443