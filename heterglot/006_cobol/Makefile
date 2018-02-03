.PHONY: all
all:
	$(eval ID := $(shell docker build . -q))
	docker run --rm $(ID)

.PHONY: nodocker
nodocker:
	cobc zero-zero-six.cob
	cobcrun zero-zero-six
