
all:
	@rm -rf /home/eryilmaz/data
	@mkdir -p /home/eryilmaz/data/wordpress
	@mkdir -p /home/eryilmaz/data/mysql
	@docker-compose -f srcs/docker-compose.yml up  -d --build

down:
	@docker-compose -f srcs/docker-compose.yml down

re: clean all

clean:
	@rm -rf /home/eryilmaz/data
	@docker-compose -f srcs/docker-compose.yml down -v --remove-orphans     # Down ile konteynerleri durdurur ve bağlı volumeleri kaldırır
	@docker rmi -f $$(docker images -q) # Kullanılmayan imajları siler
clear:
	@docker system prune -a -f

.PHONY: all down re clean clear
