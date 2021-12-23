all: up

up: 
	# @sudo mkdir -p ~/data/mariadb
	# @sudo mkdir -p ~/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up
	@printf "Containers running..."

down: 
	@docker-compose -f ./srcs/docker-compose.yml down
	@printf "Containers down success"


clean:
	@sudo docker stop $(docker ps -qa); 
	@sudo docker rm $(docker ps -qa);
	@sudo docker rmi -f $(docker images -qa); 

fclean: clean
	@sudo docker volume rm $(docker volume ls -q);
	@sudo docker network rm $(docker network ls -q) 2>/dev/null

remove: fclean 
	sudo docker system prune -a --volume
	sudo docker system prune -a --force
	sudo rm -Rf ~/data/mariadb
	sudo rm -Rf ~/data/wordpress

re: fclean all

.PHONY: all up down clean fclean remove re