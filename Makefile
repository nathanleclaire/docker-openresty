build:
	docker build -t nathanleclaire/openresty .
run:
	docker rm containerlua || true
	docker run \
		-d \
		--name containerlua \
		--net host \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		nathanleclaire/openresty
push:
	docker push nathanleclaire/openresty
