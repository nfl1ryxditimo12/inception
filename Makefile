all: start

start:
	@docker-compose -f srcs/docker-compose.yml up --build

stop:
	@docker-compose -f srcs/docker-compose.yml down

.PHONY: all start stop
