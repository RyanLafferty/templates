#/bin/bash
#Source: https://knative.dev/docs/install/knative-with-minikube/

kubectl delete svc knative-ingressgateway -n istio-system
kubectl delete deploy knative-ingressgateway -n istio-system

curl -L https://github.com/knative/serving/releases/download/v0.5.0/serving.yaml \
  | sed 's/LoadBalancer/NodePort/' \
  | kubectl apply --filename -