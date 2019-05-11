#/bin/bash
#Sources:
#    https://knative.dev/docs/install/knative-with-minikube/

minikube start --memory=8192 --cpus=4 \
  --kubernetes-version=v1.12.0 \
#  --vm-driver=kvm2 \ # omitting driver
  --disk-size=30g \
  --extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook"