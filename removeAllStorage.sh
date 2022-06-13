#!/bin/bash
kubectl delete -f ./local-storage/local-storage.yaml
kubectl patch pv authservice-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pv katib-mysql -p '{"metadata":{"finalizers":null}}'
kubectl patch pv minio-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pv mysql-pv-claim -p '{"metadata":{"finalizers":null}}'
kubectl delete -f ./local-storage/authservice-pvc.yaml
kubectl delete -f ./local-storage/katib-mysql.yaml
kubectl delete -f ./local-storage/minio-pvc.yaml
kubectl delete -f ./local-storage/mysql-pv-claim.yaml
