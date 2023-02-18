
DB_NAME=db-workshop



start-postgres:
	docker build -t $(DB_NAME) .
	docker run -d --rm --name $(DB_NAME) -p 5432:5432 $(DB_NAME)
	docker ps

stop-db:
	docker stop $(DB_NAME)
	docker ps -a

