all: up

up: 
	@mkdir -p /home/jsiona/data/mariadb
	@mkdir -p /home/jsiona/data/web
	@docker-compose -f ./srcs/docker-compose.yml up
	@printf "Containers running..."

down: 
	@docker-compose -f ./srcs/docker-compose.yml down
	@printf "Containers down success"


clean:
	@docker stop $(docker ps -qa); 
	@docker rm $(docker ps -qa);
	@docker rmi -f $(docker images -qa); 

fclean: clean
	@docker volume rm $(docker volume ls -q);
	@docker network rm $(docker network ls -q) 2>/dev/null

remove:  
	docker system prune -a --force
	rm -Rf ~/data/mariadb
	rm -Rf ~/data/web

re: fclean all

.PHONY: all up down clean fclean remove re