# jenkins kubernetes
jenkins master + slave

# minikube
$ sudo scp -i $(minikube ssh-key) /etc/docker/certs.d/101.55.50.200\:5000/client.crt docker@$(minikube ip):/home/docker/
$ minikube ssh
$ sudo mkdir -p /etc/docker/certs.d/101.55.50.20:5000
$ cp client.crt /etc/docker/certs.d/101.55.50.20:5000

# pod update
kubectl patch deployment jenkins -p "{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"build_id\":\"`date +'%s'`\"}}}}}"

# kubernetes user token
kubectl create serviceaccount jenkins-admin
kubectl create rolebinding jenkins-admin-binding --clusterrole=cluster-admin --serviceaccount=default:jenkins-admin
kubectl get serviceaccount jenkins-admin -o go-template --template='{{range .secrets}}{{.name}}{{"\n"}}{{end}}'
kubectl get secrets jenkins-admin-token-clwws -o go-template --template '{{index .data "token"}}' | base64 -d

