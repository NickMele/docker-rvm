NAME = nickmele/docker-rvm
VERSION = 2.2.1

.PHONY: build

build:
	docker build -t $(NAME):$(VERSION) --rm .

test:
	docker run -t --rm $(NAME):$(VERSION) echo hello world!

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

release: test tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"
