DOCKER_PATH = ./srcs/docker-compose.yml

all : 
	docker-compose -f $(DOCKER_PATH) up -d --build

clean :
	docker-compose -f $(DOCKER_PATH) down

fclean : clean
	sh clean.sh

re : fclean
	$(MAKE) all

.PHONY : all clean fclean re