#!/bin/bash

echo 'create resource group'
az group create \
--name aks \
--location eastus

echo 'create AKS'
az aks create \
--name aks01 \
--resource-group aks \
--node-count 1 \
--enable-addons monitoring \
--ssh-key-value ~/.ssh/aks/aks01/id_rsa.pub
