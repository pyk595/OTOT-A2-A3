echo starting

kind create cluster --name kind-1 --config ../../k8s/kind/cluster-config.yaml

echo running get nodes
kubectl get nodes

echo loading image into cluster
kind load docker-image yuanker/a1_app:latest --name kind-1

echo deploy image
kubectl apply -f ../../k8s/manifests/backend-deployment.yaml

echo apply ingress manifest
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

sleep 30 # sleep to allow ingress to work

echo apply service
kubectl apply -f ../../k8s/manifests/service.yaml

kubectl get svc

echo creating ingress...
kubectl apply -f ../../k8s/manifests/ingress.yaml --context kind-kind-1

kubectl get ingress

echo visit localhost:80
curl localhost/