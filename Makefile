#
# help
#
help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/^GNUmakefile://' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## docker-compose build
	docker-compose build

up: ## docker-compose up
	docker-compose up -d --build

down: ## docker-compose down
	docker-compose down

logs: ## docker-compose logs
	docker-compose logs ruboty

restart: ## restart docker conmpose (with build)
	docker-compose down
	make -C . build
	docker-compose up -d
