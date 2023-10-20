#!/bin/bash

# validate k8s cluster
linkerd check --pre

# install crds -> custom resource definitions
linkerd install --crds | kubectl apply -f -

linkerd install | kubectl apply -f -
