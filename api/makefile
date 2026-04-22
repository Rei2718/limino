INFRA_DIR = ../infrastructure
VERSION   = $(shell cd $(INFRA_DIR) && terraform output -raw imageVersion)
REGISTRY  = $(shell cd $(INFRA_DIR) && terraform output -raw registryUrl)
APP_NAME  = $(shell cd $(INFRA_DIR) && terraform output -raw appServiceName)
RG_NAME   = $(shell cd $(INFRA_DIR) && terraform output -raw resourceGroupName)
IMAGE     = api

build:
	docker buildx build \
		--platform linux/amd64 \
		-t $(REGISTRY)/$(IMAGE):$(VERSION) \
		--push \
		.

deploy: build
	az webapp restart \
		--resource-group $(RG_NAME) \
		--name $(APP_NAME)