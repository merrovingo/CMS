#! /bin/bash

# Enrique Tezozomoc | merrovingo@gmail.com

# Script actualiza las URL de un Wordpress que ha sido cambiado de lugar o bien modificado el dominio

# La URL puede ir en formato "http://dominio.com" o bien unicamente "dominio.com"

USUARIO_MYSQL="Nombre de usuario"
PASSWD_MYSQL="Contraseña"
BASE_MYSQL="Nombre de la base de datos"
URL_VIEJA="URL o direccion IP antigua"
URL_NUEVA="URL o direccion IP nueva"

echo "Iniciando la actualizacion de URL's..."

mysql -u$USUARIO_MYSQL -p$PASSWD_MYSQL $BASE_MYSQL -e"UPDATE wp_options SET option_value = replace(option_value, '$URL_VIEJA', '$URL_NUEVA') WHERE option_name = 'home' OR option_name = 'siteurl';" >> $BASE_MYSQL_$(date +%Y-%m-%d).log

mysql -u$USUARIO_MYSQL -p$PASSWD_MYSQL $BASE_MYSQL -e"UPDATE wp_posts SET guid = replace(guid, '$URL_VIEJA', '$URL_NUEVA');" >> $BASE_MYSQL_$(date +Y-%m-%d).log

mysql -u$USUARIO_MYSQL -p$PASSWD_MYSQL $BASE_MYSQL -e"UPDATE wp_posts SET post_content = replace(post_content, '$URL_VIEJA', '$URL_NUEVA');" >> $BASE_MYSQL_$(date +%Y-%m-%d).log

mysql -u$USUARIO_MYSQL -p$PASSWD_MYSQL $BASE_MYSQL -e"UPDATE wp_postmeta SET meta_value = replace(meta_value, '$URL_VIEJA', 'URL_NUEVA');" >> $BASE_MYSQL_$(date +%Y-%m-%d).log

echo "Actualizacion terminada."

