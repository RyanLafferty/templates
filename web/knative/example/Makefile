.PHONY: build-container push-container
.PHONY: create-service get-service-domain test-service
.PHONY: delete-service

build-container:
	docker build -t localhost:5000/helloworld-python:1.0.0 .
push-container:
	docker push localhost:5000/helloworld-python:1.0.0
create-service:
	kubectl apply --filename app.yaml  
get-service-domain:
	kubectl get ksvc app --output jsonpath='{.status.domain}'
test-service:
	curl -H "Host: app.default.example.com" http://${GATEWAY}
delete-service:
	kubectl delete ksvc app
