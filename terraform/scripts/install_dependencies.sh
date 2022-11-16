#!/bin/bash
set -e

sudo apt update
sudo apt upgrade -y
sudo curl -fsSL https://get.docker.com | sh
