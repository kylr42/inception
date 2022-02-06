all: up

up: 
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/web
	@docker-compose -f ./srcs/docker-compose.yml up
	@echo "Containers running..."

down: 
	@docker-compose -f ./srcs/docker-compose.yml down
	@echo "Containers down success"


clean:
	@docker stop $(docker ps -qa) 2>/dev/null || true;
	@docker rm $(docker ps -qa) 2>/dev/null || true;
	@docker rmi -f $(docker images -qa) 2>/dev/null || true;

fclean: clean
	@echo "Docker cleaninig..."
	@docker volume rm $(docker volume ls -q) 2>/dev/null || true;
	@docker network rm $(docker network ls -q) 2>/dev/null || true;

remove:		
	@docker system prune -a --force
	@rm -rf ~/data

re: fclean all

.PHONY: all up down clean fclean remove re