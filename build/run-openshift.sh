#!/usr/bin/env bash
wget https://github.com/openshift/origin/releases/download/v${OPENSHIFT_VERSION}/${OPENSHIFT_BIN}.tar.gz
tar xvzOf ${OPENSHIFT_BIN}.tar.gz ${OPENSHIFT_BIN}/oc > oc
sudo mv oc /usr/local/bin/oc
sudo chmod 755 /usr/local/bin/oc
sudo oc cluster up --skip-registry-check=true
sudo chmod 755 openshift.local.clusterup/kube-apiserver/admin.kubeconfig