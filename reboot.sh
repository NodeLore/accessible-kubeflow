#!/bin/bash
kubectl delete -f kubeflow-storage.yaml
kubectl apply -f kubeflow-storage.yaml
kubectl delete namespace knative-serving
kubectl delete namespace knative-eventing
kubectl delete namespace kubeflow
kubectl delete namespace kserve
kubectl delete namespace istio-system
kubectl delete namespace cert-manager
kubectl delete namespace auth
while ! kustomize build example | kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done
