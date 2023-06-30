#!/bin/bash

apt update;apt install -y curl;curl -fsSL https://get.docker.com -o get-docker.sh;sudo sh get-docker.sh;sudo usermod -aG docker $USER;apt update;apt install -y iproute2 iputils-ping;