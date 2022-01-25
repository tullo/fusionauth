#!/bin/bash

# trigger okteto auto-ingress
kubectl patch svc fusionauth -p '{"metadata":{"annotations":{"dev.okteto.com/auto-ingress": "true"}}}'

# change target port to 9011
kubectl patch svc fusionauth --type='json' -p '[{"op": "replace", "path": "/spec/ports/0", "value": {"name": "http", "port": 8080, "targetPort": 9011}}]'
