FROM php:7.4-fpm

WORKDIR $PHP_INI_DIR
EXPOSE 9000

# Use the default production configuration
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# RUN sed -i "s/^doc_root =/doc_root = \/usr\/share\/nginx\/html/g" "$PHP_INI_DIR/php.ini"