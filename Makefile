.PHONY: init package tag push clean test default local bash docs

GIT_HASH := $(shell git rev-parse --short HEAD)
GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
IMAGE_NAME := "astropuffin/bluegreen"

clean:
	@# no clean steps

init:
	@# no init steps

package:
	docker build --build-arg GIT_HASH=$(GIT_HASH) -t $(IMAGE_NAME):$(GIT_HASH) .

test: package
	@# no tests

tag:
	docker tag $(IMAGE_NAME):$(GIT_HASH) $(IMAGE_NAME):${GIT_BRANCH}

push: tag
	@# no push

run:
	docker run --rm -it -e "COLOR=blue" -p 8080:8080 $(IMAGE_NAME):${GIT_BRANCH}
