#!/usr/bin/env bash

#docker run --name oc-cluster-up -d -v /etc/docker/certs.d/:/certs/ -v /tmp/:/tmp/ -v /var/run/docker.sock:/var/run/docker.sock gustavonalle/oc-cluster-up

#function get_master {
#   echo $(docker exec openshift-master oc describe node/openshift-master-node  | grep InternalIP | awk '{print $2}')
#}
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
tar xvzOf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz > oc.bin
sudo mv oc.bin /usr/local/bin/oc
sudo chmod 755 /usr/local/bin/oc
sudo oc cluster up 
SLEEP=3
MAX_WAIT=100

echo "Waiting for OKD to be ready..."

while ! curl -k -s "https://localhost:8443/healthz/ready"
do
    echo "Still waiting..."
    ((c++)) && ((c==$MAX_WAIT)) && exit 1
    sleep $SLEEP
done