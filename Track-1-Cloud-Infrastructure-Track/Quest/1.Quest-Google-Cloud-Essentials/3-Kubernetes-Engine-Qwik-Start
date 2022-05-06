curl -o default.sh https://raw.githubusercontent.com/user9-21/GoogleCloudReady-Facilitator-program/main/files/default.sh
source default.sh

gcloud config set compute/zone us-central1-a
gcloud container clusters create my-cluster
echo "${GREEN}${BOLD}

Task 1 Completed

${RESET}"

gcloud container clusters get-credentials my-cluster
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
echo "${GREEN}${BOLD}

Task 2 Completed

${RESET}"
kubectl expose deployment hello-server --type=LoadBalancer --port 8080
kubectl get service

#wait for external ip of cluster
sleep 10
kubectl get service
echo "${GREEN}${BOLD}

Task 3 Completed

${RESET}"

gcloud container clusters delete my-cluster

echo "${GREEN}${BOLD}

Task 4 Completed

${RESET}"

echo "${GREEN}${BOLD}

Lab Completed

${RESET}"
