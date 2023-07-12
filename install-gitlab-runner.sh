#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

arch=amd64

# Check for Debian/Ubuntu/Mint
if command_exists apt-get; then
  # Replace ${arch} with the desired architecture, e.g., amd64, arm, arm64
  curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_${arch}.deb"
  dpkg -i gitlab-runner_${arch}.deb

# Check for RHEL/CentOS/Fedora
elif command_exists yum; then
  # Replace ${arch} with the desired architecture, e.g., amd64, arm, arm64
  curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_${arch}.rpm"
  rpm -i gitlab-runner_${arch}.deb

# Check for FIPS compliant GitLab Runner on RHEL
elif [ -f /etc/redhat-release ] && grep -q "Red Hat" /etc/redhat-release && command_exists yum; then
  # Currently, only amd64 is a supported architecture for FIPS compliant GitLab Runner
  curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_amd64-fips.rpm"
  rpm -i gitlab-runner_${arch}.deb


# If no supported package manager is found, display an error message
else
  echo "Unsupported operating system"
  figlet fail
  exit 1
fi
