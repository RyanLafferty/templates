#/bin/bash
# Sources:
#    https://istio.io/docs/tasks/traffic-management/ingress/

export INGRESS_HOST=$(minikube ip)
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath=’{.spec.ports[?(@.name=="http2")].nodePort}’)
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')

export GATEWAY=$INGRESS_HOST:$INGRESS_PORT
export SECURE_GATEWAY=$INGRESS_HOST:$SECURE_INGRESS_PORT