.PHONY: help up down reset logs psql ps

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-8s %s\n", $$1, $$2}'

.env:
	cp .env.example .env

up: .env ## Start the local stack and wait until it is healthy
	docker compose up -d --wait

down: ## Stop the stack (keeps data)
	docker compose down

reset: ## Stop the stack and delete all local data
	docker compose down -v

logs: ## Follow logs
	docker compose logs -f

ps: ## Show service status
	docker compose ps

psql: ## Open a psql shell on the source database
	docker compose exec source-db sh -c 'psql -U $$POSTGRES_USER -d $$POSTGRES_DB'
