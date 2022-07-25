REPO_NAME=tomy0000000/postgres-backup-dropbox
BASE_TAG=14

all: build

build:
	docker build --build-arg "BASE_TAG=$(BASE_TAG)" --tag "$(REPO_NAME):$(BASE_TAG)" .

push: build
	docker push "$(REPO_NAME):$(BASE_TAG)"
