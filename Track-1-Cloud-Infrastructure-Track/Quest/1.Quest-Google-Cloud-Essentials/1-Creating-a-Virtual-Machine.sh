curl -o default.sh https://raw.githubusercontent.com/user9-21/GoogleCloudReady-Facilitator-program/main/files/default.sh
source default.sh

export PROJECT=$GOOGLE_CLOUD_PROJECT
gcloud compute instances create gcelab --machine-type n1-standard-2 --zone us-central1-f --tags=http-server --create-disk=auto-delete=yes,boot=yes,device-name=gcela,image=projects/debian-cloud/global/images/debian-10-buster-v20210916,mode=rw,size=10,type=projects/$PROJECT/zones/us-central1-f/diskTypes/pd-balanced 
cat > ssh.sh <<EOF
sudo su -
apt-get update
apt-get install nginx -y
ps auwx | grep nginx
exit
exit
echo "${GREEN}${BOLD}

Task 1 Completed

${RESET}"
EOF
chmod +x ssh.sh
echo "${CYAN}${BOLD}

File permission granted to ssh.sh

${RESET}"
gcloud compute instances create gcelab2 --machine-type n1-standard-2 --zone us-central1-f 


gcloud compute scp --zone=$ZONE --quiet ssh.sh gcelab:~

echo "${BOLD}${YELLOW}

Run this in ssh:
${BG_RED}
./ssh.sh
${RESET}"

gcloud compute ssh gcelab --zone=us-central1-f


echo "${GREEN}${BOLD}

Lab Completed

${RESET}"
