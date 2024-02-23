DOCKER_PATH = ./srcs/docker-compose.yml
VOLUME_PATH = /Users/ihahyeon/docker_volume
#/home/hahlee/data

all : 
	mkdir $(VOLUME_PATH)/mariadb/
	docker-compose -f $(DOCKER_PATH) up -d --build

clean :
	docker-compose -f $(DOCKER_PATH) down

fclean : clean
	sh clean.sh

re : fclean
	$(MAKE) all

.PHONY : all clean fclean re