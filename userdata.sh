#!/bin/bash

sudo apt update
sudo apt install python3 -y

sudo systemctl start ssh
sudo systemctl enable ssh