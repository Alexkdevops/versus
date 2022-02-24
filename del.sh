#!/bin/bash
kubectl delete deploy api-deployment -n dev
kubectl delete deploy api-deployment -n prod
kubectl delete deploy web-deployment -n dev
kubectl delete deploy web-deployment -n prod
kubectl delete svc backend -n dev
kubectl delete svc backend -n prod
kubectl delete svc frontend -n dev
kubectl delete svc frontend -n prod
kubectl delete ns prod dev