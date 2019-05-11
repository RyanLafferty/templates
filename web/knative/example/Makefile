.PHONY: create-service get-service-domain
.PHONY: delete-service

create-service:
	kubectl apply --filename app.yaml  
get-service-domain:
	kubectl get ksvc app --output jsonpath='{.status.domain}'
delete-service:
	kubectl delete ksvc app
