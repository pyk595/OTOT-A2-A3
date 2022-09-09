echo apply metrics-server manifest
kubectl apply -f ../../k8s/manifests/metrics-server.yaml

echo apply backend-hpa manifest
kubectl apply -f ../../k8s/manifests/backend-hpa.yaml