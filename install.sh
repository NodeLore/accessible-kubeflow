#!/bin/bash
kubectl apply -f local-storage/local-storage.yaml
kubectl apply -f local-storage/katib-mysql.yaml
kubectl apply -f local-storage/authservice-pvc.yaml
kubectl apply -f local-storage/minio-pvc.yaml
kubectl apply -f local-storage/mysql-pv-claim.yaml
while ! kustomize build example | kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done
