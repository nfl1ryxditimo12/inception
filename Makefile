all: start

build:
	@sh ${PWD}/scripts/docker-permission.sh
	@mkdir -p ~/data/wordpress ~/data/mariadb

start: build
	@sleep 1
	@docker-compose -f srcs/docker-compose.yml up --build

stop:
	@docker-compose -f srcs/docker-compose.yml down

clean:
	@docker rm -f `docker ps -aq` || docker rmi -f `docker images -aq`

fclean:
	@docker rm -f `docker ps -aq` || docker rmi -f `docker images -aq`
	@sudo rm -rf ~/data/*
	@sudo docker system prune --volumes --force

re: clean
	@make all

fre: fclean
	@make all

.PHONY: all build start stop clean fclean re fre
