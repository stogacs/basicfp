TARGET ?= target

LATEXMK ?= latexmk

DOCKER ?= docker

.PHONY : index index-docker ascii-decoder utf8-decoder utf8-encoder create-target

index : create-target index.tex $(wildcard sections/*)
	$(LATEXMK)

index-docker : create-target index.tex $(wildcard sections/*) references.bib
	DOCKER_BUILDKIT=1	$(DOCKER) build --output $(TARGET) .

create-target :
	@mkdir -p $(TARGET)
