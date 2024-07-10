kind load docker-image tp-docker-compose-result --name formation
kind load docker-image tp-docker-compose-vote --name formation
kind load docker-image tp-docker-compose-worker --name formation

kubectl apply -f deployment-data.yaml
kubectl apply -f deployment-result.yaml
kubectl apply -f deployment-worker.yaml
kubectl apply -f deployment-vote.yaml
kubectl apply -f services.yaml