.PHONY: help build run exec stop rm rmi

IMAGE_NAME = my-ubuntu:20.04
CONTAINER_NAME = linux-practice

# Description
HELP_DESC = Show this help message
BUILD_DESC = Build Docker image
RUN_DESC = Run Docker container
EXEC_DESC = Execute shell in running container
STOP_DESC = Stop running container
RM_DESC = Remove container
RMI_DESC = Remove image

# Docker
ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOCKER_ROOT_DIR := /src/
DOCKER_MOUNT_ROOT := --mount type=bind,source=$(ROOT_DIR),target=$(DOCKER_ROOT_DIR)

# Help
help:
	@echo "Usage: make [TARGET]"
	@echo "Targets:"
	@echo "  help    - $(HELP_DESC)"
	@echo "  build   - $(BUILD_DESC)"
	@echo "  run     - $(RUN_DESC)"
	@echo "  exec    - $(EXEC_DESC)"
	@echo "  stop    - $(STOP_DESC)"
	@echo "  rm      - $(RM_DESC)"
	@echo "  rmi     - $(RMI_DESC)"

# Build Docker image
build:
	docker build -t $(IMAGE_NAME) .
#	docker build --no-cache -t $(IMAGE_NAME) .
#	docker run -d $(DOCKER_MOUNT_ROOT) --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Run Docker container
run:
#	docker run -d $(DOCKER_MOUNT_ROOT) --name $(CONTAINER_NAME) $(IMAGE_NAME)
	docker run -it $(DOCKER_MOUNT_ROOT) --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Execute shell in running container
exec:
	docker exec -it $(CONTAINER_NAME) bash

# Start stopped container
start:
	docker start $(CONTAINER_NAME)

# Stop running container
stop:
	docker stop $(CONTAINER_NAME)

# Remove Docker container
rm:
	docker container rm $(CONTAINER_NAME)

# Remove Docker image
rmi:
	docker rmi $(IMAGE_NAME)
#	docker image rm $(IMAGE_NAME)
