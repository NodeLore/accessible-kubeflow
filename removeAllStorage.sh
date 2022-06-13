#!/bin/bash
kubectl delete -f ./local-storage/*
kubectl patch pv authservice-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pv katib-mysql -p '{"metadata":{"finalizers":null}}'
kubectl patch pv minio-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pv mysql-pv-claim -p '{"metadata":{"finalizers":null}}'