NAME := inception

all:$(NAME)

$(NAME): upd

up: create_volumes
	@docker compose -f ./srcs/docker-compose.yml up --build

upd: create_volumes
	@docker compose -f ./srcs/docker-compose.yml  up -d --build

create_volumes:
	@bash ./srcs/requirements/tools/create_volumes.sh

remove_volumes:
	@rm -rf /home/abouramd/data

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

remove: stop
	@docker compose -f ./srcs/docker-compose.yml remove

down:
	@docker compose -f ./srcs/docker-compose.yml down -t 1 | exit 0

logs:
	@echo "-------------------------- nginx -------------------------------"
	@docker container logs nginx
	@echo "-------------------------- wordpress -------------------------------"
	@docker container logs wordpress
	@echo "-------------------------- mariadb -------------------------------"
	@docker container logs mariadb
	@echo "-------------------------- adminer -------------------------------"
	@docker container logs adminer
	@echo "-------------------------- ftp-server -------------------------------"
	@docker container logs ftp-server
	@echo "-------------------------- portfolio -------------------------------"
	@docker container logs portfolio
	@echo "-------------------------- code-server -------------------------------"
	@docker container logs code-server
	@echo "-------------------------- redis -------------------------------"
	@docker container logs redis

ls:
	@docker compose -f ./srcs/docker-compose.yml ps 

clean: down

fclean: clean 
	@docker image rm nginx wordpress mariadb adminer ftp-server portfolio code-server redis > /dev/null 2> /dev/null & echo "remove images"
	@docker network rm inception 2> /dev/null > /dev/null & echo "remove network"

re: fclean all
