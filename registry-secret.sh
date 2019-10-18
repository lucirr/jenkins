#!/bin/sh
kubectl create secret docker-registry regcred --docker-server=101.55.50.200:5000 --docker-username=sudouser --docker-password=sudouser
