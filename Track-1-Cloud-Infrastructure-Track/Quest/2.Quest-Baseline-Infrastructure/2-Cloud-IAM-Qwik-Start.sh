curl -o default.sh https://raw.githubusercontent.com/user9-21/GoogleCloudReady-Facilitator-program/main/files/default.sh
source default.sh

export BUCKET_NAME=$(gcloud info --format='value(config.project)')
gsutil mb gs://$BUCKET_NAME/
wget --output-document sample.txt https://www.cloudskillsboost.google/
gsutil cp sample.txt gs://$BUCKET_NAME

completed "Task 1"

export PROJECT_ID=$(gcloud info --format='value(config.project)')
export LASTUSER=$(sed -E 's/MEMBERS: //gm;t;d' <<< $(gcloud projects get-iam-policy $PROJECT_ID --flatten="bindings[].members" --format='table(bindings.members)' --filter="bindings.members:user:student*" |& tail -1))
echo $LASTUSER 
gcloud projects remove-iam-policy-binding $PROJECT_ID --role='roles/viewer' --member $LASTUSER

completed "Task 2"
gcloud projects add-iam-policy-binding $PROJECT_ID --role='roles/storage.objectViewer' --member $LASTUSER


completed "Task 3"

completed "Lab"

remove_files 
