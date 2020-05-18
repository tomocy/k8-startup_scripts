#/bin/bash

echo 'Create cluster1'
kind create cluster --name cluster1 --config ${TOMOCY}/k8s-startup_scripts/kind/kind.yaml

echo 'Set up ingress controller'
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s