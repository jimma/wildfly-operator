#!/usr/bin/env bash
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
tar xvzOf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz > oc.bin
sudo mv oc.bin /usr/local/bin/oc
sudo chmod 755 /usr/local/bin/oc
oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin developer
oc apply -f deploy/service_account.yaml
oc apply -f deploy/role.yaml
oc apply -f deploy/role_binding.yaml
oc apply -f deploy/crds/wildfly_v1alpha1_wildflyserver_crd.yaml
oc apply -f deploy/operator.yaml
oc login -u developer