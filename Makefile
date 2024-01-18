.PHONY: certs
certs:
	mkcert -install
	$(shell cat "$(mkcert -CAROOT)/rootCA.pem" > ca.pem")
	mkcert service-active.default.svc service.default.svc workload.default.svc
	
.PHONY: up
up: certs
	docker-compose up -d --build

.PHONY: down
down:
	docker-compose down

.PHONY: test-service
test-service:
	curl https://service.default.svc:9000

.PHONY: test-service-active
test-service-active:
	curl https://service-active.default.svc:9000