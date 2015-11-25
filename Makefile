CONFD_VERSION=0.10.0

.PHONY: build
build: confd
	docker build -t inquicker/confd:$(CONFD_VERSION) .

.PHONY: clean
clean:
	rm confd

confd:
	curl -L -o confd https://github.com/kelseyhightower/confd/releases/download/v$(CONFD_VERSION)/confd-$(CONFD_VERSION)-linux-amd64
	chmod 700 confd
