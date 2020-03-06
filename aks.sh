#!/bin/bash

echo 'create resource group'
az group create \
--name aks \
--location eastus

echo 'create AKS'
az aks create \
--resource-group aks \
--name aks01 \
--node-count 1 \
--enable-addons monitoring \
--ssh-key-value ~/.ssh/aks/aks01/id_rsa.pub

echo 'get AKS credentials'
az aks get-credentials \
--resource-group aks \
--name aks01

echo 'delete resource group if you do not want to be charged by following command'
echo '  az group delete --name aks --yes --no-wait'