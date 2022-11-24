#!/bin/bash

echo "fazendo build das imagens"

sudo docker build -t eveigadev/k8s-glpi backend/.
sudo docker build -t eveigadev/k8s-glpidb database/.

echo "enviando imagens criadas para o docker hub"

sudo docker push eveigadev/k8s-glpi
sudo docker push eveigadev/k8s-glpidb

echo "subindo os servicos"

kubectl apply -f service.yml

echo "subindo aplicoes/pods"

kubectl apply -f deploy.yml
