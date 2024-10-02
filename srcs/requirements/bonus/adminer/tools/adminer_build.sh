apt-get update &&
  apt-get upgrade -y &&
  apt-get install adminer php-fpm php-mysql -y &&
  cp /usr/share/adminer/designs/dracula/adminer.css /usr/share/adminer/ &&
	mkdir -p /run/php/ &&
	echo "listen = 0.0.0.0:9000" >> /etc/php/7.4/fpm/php-fpm.conf
