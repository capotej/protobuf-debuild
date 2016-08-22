build_image:
	docker build -t protobuf-debuild build-image/

protobuf: build_image
	docker run -v $(CURDIR)/protobuf:/build -it protobuf-debuild

debug: build_image
	docker run -it --entrypoint=/bin/bash protobuf-debuild:latest
