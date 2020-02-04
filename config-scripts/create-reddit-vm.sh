#!/bim/bash

gcloud compute instances create reddit-app-start-up \
--boot-disk-size=10GB \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--image-project=infra-262720 \
--image=reddit-full-1580835443
