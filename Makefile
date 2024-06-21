BASEURL :=  "http://localhost:8087/"

##@ Docker

.PHONY: docker-build
docker-build: ## Build the docker image
	docker build \
    -t innov-blog:latest \
    --build-arg HUGO_BASEURL=$(BASEURL) \
    .

.PHONY: docker-run
docker-run: ## Run the built docker image
	docker run -p 8087:80 innov-blog:latest


##@ Kubernetes

.PHONY: build
build: ## Build and push
	docker build -t registry.thalesdigital.io/tsn/innovation/projects/blog/blog:latest --build-arg HUGO_BASEURL=$(BASEURL) .
	docker login registry.thalesdigital.io -u $(USERNAME) -p $(TOKEN)
	docker push registry.thalesdigital.io/tsn/innovation/projects/blog/blog:latest

	helm package helm/blog
	curl --fail-with-body --request POST       --form "chart=@blog-0.1.0.tgz"       --user $(USERNAME):$(TOKEN)       https://gitlab.thalesdigital.io/api/v4/projects/56500/packages/helm/api/dev/charts

.PHONY: deploy
deploy: ## Deploy to kubernetes cluster
	helm repo add blog https://gitlab.thalesdigital.io/api/v4/projects/56500/packages/helm/dev/ --username $(USERNAME) --password $(TOKEN)
	helm repo update blog
	helm upgrade --install blog blog/blog

.PHONY: undeploy
undeploy:  ## Undeploy from kubernetes cluster
	$(HELM) uninstall punch-board

##@ Help

.PHONY: help
help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "\033[36m\033[0m\n"} /^[ 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)