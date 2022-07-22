#!/bin/bash
sudo kubectl apply -f local-storage/local-storage.yaml
sudo kubectl apply -f local-storage/katib-mysql.yaml
sudo kubectl apply -f local-storage/authservice-pvc.yaml
sudo kubectl apply -f local-storage/minio-pvc.yaml
sudo kubectl apply -f local-storage/mysql-pv-claim.yaml
while ! kustomize build example | sudo kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done
