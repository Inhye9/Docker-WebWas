#!/bin/bash

kubectl create secret generic $1 --from-file=$2 --type=Opaque 
