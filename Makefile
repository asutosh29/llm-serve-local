.PHONY: help llm-up llm-down gateway-up gateway-down

help: ## Show this help message
        @echo "Usage: make [target]"
        @echo ""
        @echo "Targets:"
        @grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

llm-up: ## Start the vLLM service (detached)
        @docker compose -f ./vllm/docker-compose.yaml up -d

llm-down: ## Stop the vLLM service
        @docker compose -f ./vllm/docker-compose.yaml down

llm-cpu-up: ## Start the vLLM service on CPU (detached)
        @docker compose -f ./vllm/docker-compose.cpu.yaml up -d

llm-cpu-down: ## Stop the vLLM service on CPU
        @docker compose -f ./vllm/docker-compose.cpu.yaml down

gateway-up: ## Start the Gateway service (detached)
        @docker compose -f ./gateway/docker-compose.yaml up -d

gateway-down: ## Stop the Gateway service
        @docker compose -f ./gateway/docker-compose.yaml down

deploy-gateway: ## Pulls the latest on prod branch and updates the Gateway service
        @git pull origin amx/prod
        @make gateway-up

clean: ## Cleans any hanging volumes (This action cannot be undone!)
        @echo "Cleaning handing docker volumes"
        @docker compose -f ./vllm/docker-compose.yaml down -v
        @docker compose -f ./vllm/docker-compose.cpu.yaml down -v
        @docker compose -f ./gateway/docker-compose.yaml down -v