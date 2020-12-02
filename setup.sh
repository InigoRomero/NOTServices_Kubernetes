#kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $1}') | awk '$1=="token:"{print $2}'
#kubectl proxy --address="localhost" -p 8001 --accept-hosts='^*$'



kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $1}') | awk '$1=="token:"{print $2}'


#docker stack rm ft_services
docker stack deploy --compose-file docker-compose.yml ft_services
kubectl apply -f srcs/ingress.yaml  
kubectl get ingress
kubectl proxy