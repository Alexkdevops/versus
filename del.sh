#!/bin/bash

#Delete NS

kubectl delete ns main dev prod

# Delete deploy from all namespaces
kubectl delete deploy api-deployment -n main
kubectl delete deploy web-deployment -n main
kubectl delete deploy api-deployment -n dev
kubectl delete deploy api-deployment -n prod
kubectl delete deploy web-deployment -n dev
kubectl delete deploy web-deployment -n prod
# Delete SVC from all namespaces
kubectl delete svc backend -n dev
kubectl delete svc backend -n prod
kubectl delete svc frontend -n dev
kubectl delete svc frontend -n prod
kubectl delete svc backend -n main
kubectl delete svc frontend -n main
# Delete Ingress from all namespaces
kubectl delete ingress frontend-svc -n main
kubectl delete ingress backend-svc -n main
kubectl delete ingress frontend-svc -n prod
kubectl delete ingress backend-svc -n prod
kubectl delete ingress frontend-svc -n dev
kubectl delete ingress backend-svc -n dev

# Delete Secrets and Svc for database
kubectl delete secret credentials -n main
kubectl delete svc mysql-service -n main
kubectl delete secret credentials -n dev
kubectl delete svc mysql-service -n dev
kubectl delete secret credentials -n prod
kubectl delete svc mysql-service -n prod