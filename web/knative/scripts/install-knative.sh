#/bin/bash
#Sources:
#    https://knative.dev/docs/install/knative-with-minikube/
#    https://knative.dev/docs/install/knative-custom-install/

# Delete legacy gateway if present
kubectl delete svc knative-ingressgateway -n istio-system
kubectl delete deploy knative-ingressgateway -n istio-system

# Perform Knative custom install
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.5.2/serving.yaml
kubectl apply --filename https://github.com/knative/build/releases/download/v0.5.0/build.yaml
kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.5.0/eventing.yaml