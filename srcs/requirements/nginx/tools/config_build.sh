apt-get update &&
	apt-get upgrade -y &&
	apt-get install openssl -y &&
	mkdir -p "${CRS_PATH}" &&
	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout "${CRS_PATH}/nginx.key" \
		-out "${CRS_PATH}/nginx.csr" \
		-subj "/C=${CRS_COUNTRYCODE}/ST=${CRS_STATE}/L=${CRS_LOCATION}/O=${CRS_ORGANIZATION}/OU=${CRS_SECTION}/CN=${CRS_COMMONNAME}/emailAddress=${CRS_EMAIL}" &&
	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout "${CRS_PATH}/adminer.key" \
		-out "${CRS_PATH}/adminer.csr" \
		-subj "/C=${CRS_COUNTRYCODE}/ST=${CRS_STATE}/L=${CRS_LOCATION}/O=${CRS_ORGANIZATION}/OU=${CRS_SECTION}/CN=adminer.com/emailAddress=${CRS_EMAIL}" &&
	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout "${CRS_PATH}/abouramd.key" \
		-out "${CRS_PATH}/abouramd.csr" \
		-subj "/C=${CRS_COUNTRYCODE}/ST=${CRS_STATE}/L=${CRS_LOCATION}/O=${CRS_ORGANIZATION}/OU=${CRS_SECTION}/CN=abouramd.me/emailAddress=${CRS_EMAIL}"

CONF_PATH="/default"

echo "server {" >"${CONF_PATH}"
echo "  listen 443 ssl;" >>"${CONF_PATH}"
echo "  listen [::]:443 ssl;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  root /var/www/abouramd/;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  server_name abouramd.42.fr www.abouramd.42.fr;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  ssl_certificate ${CRS_PATH}/nginx.csr;" >>"${CONF_PATH}"
echo "  ssl_certificate_key ${CRS_PATH}/nginx.key;" >>"${CONF_PATH}"
echo "  ssl_protocols TLSv1.3;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  error_log /dev/stderr;" >>"${CONF_PATH}"
echo "  # access_log /dev/stdout;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  autoindex on;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  index index.php;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo '  location ~ \.php$ {' >>"${CONF_PATH}"
echo "    include snippets/fastcgi-php.conf;" >>"${CONF_PATH}"
echo "    fastcgi_pass wordpress:9000;" >>"${CONF_PATH}"
echo "  }" >>"${CONF_PATH}"
echo "}" >>"${CONF_PATH}"

echo "server {" >>"${CONF_PATH}"
echo "  listen 443 ssl;" >>"${CONF_PATH}"
echo "  listen [::]:443 ssl;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  root /usr/share/adminer/;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  server_name adminer.com www.adminer.com;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  ssl_certificate ${CRS_PATH}/adminer.csr;" >>"${CONF_PATH}"
echo "  ssl_certificate_key ${CRS_PATH}/adminer.key;" >>"${CONF_PATH}"
echo "  ssl_protocols TLSv1.3;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  error_log /dev/stderr;" >>"${CONF_PATH}"
echo "  # access_log /dev/stdout;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  autoindex on;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  index adminer.php;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo '  location ~ \.php$ {' >>"${CONF_PATH}"
echo "    include snippets/fastcgi-php.conf;" >>"${CONF_PATH}"
echo "    fastcgi_pass adminer:9000;" >>"${CONF_PATH}"
echo "  }" >>"${CONF_PATH}"
echo "}" >>"${CONF_PATH}"

echo "server {" >>"${CONF_PATH}"
echo "  listen 443 ssl;" >>"${CONF_PATH}"
echo "  listen [::]:443 ssl;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  root /var/www/portfolio;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  server_name abouramd.me www.abouramd.me;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  ssl_certificate ${CRS_PATH}/abouramd.csr;" >>"${CONF_PATH}"
echo "  ssl_certificate_key ${CRS_PATH}/abouramd.key;" >>"${CONF_PATH}"
echo "  ssl_protocols TLSv1.3;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  error_log /dev/stderr;" >>"${CONF_PATH}"
echo "  # access_log /dev/stdout;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  autoindex on;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "  index index.html;" >>"${CONF_PATH}"
echo "" >>"${CONF_PATH}"
echo "}" >>"${CONF_PATH}"

