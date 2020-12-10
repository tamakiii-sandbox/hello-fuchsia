.PHONY: help build bash clean

NAME := tamakiii-sandbox/hello-fuchsia

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(NAME) .

bash:
	docker run -it --rm -v $(PWD):/work -w /work $(NAME) $@

clean:
