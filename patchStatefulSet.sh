#!/bin/bash
kubectl patch statefulset/$1 -p '{"spec": {"template": {"spec": {"initContainers": [{"name": "fix-permission", "image": "busybox", "command": ["sh", "-c"], "args": ["chmod -R 777 /home/jovyan"], "volumeMounts": [{"mountPath": "/home/jovyan", "name": "data"}]}]}}}}' -n kubeflow-user-example-com
kubectl delete pods/$1-0 -n kubeflow-user-example-com
sudo chmod -R 777 /data
