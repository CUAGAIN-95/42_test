echo "🌟 Delete minikube... 🌟"
minikube delete

echo "🌟 Starting minikube... 🌟"
minikube start --driver=virtualbox

echo "🌟 Enabling addons... 🌟"
minikube addons enable metrics-server
minikube addons enable metallb
minikube addons enable dashboard

MINIKUBE_IP=$(minikube ip)
echo "🌟 minikube ip = $MINIKUBE_IP 🌟"

echo "🌟 Eval... 🌟"
eval $(minikube -p minikube docker-env)

echo "🌟 Start MetalLB... 🌟"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb.yaml

echo "🌟 Building images... 🌟"
docker build -qt nginx-image srcs/nginx
docker build -qt mysql-image srcs/mysql
docker build -qt wordpress-image srcs/wordpress
docker build -qt phpmyadmin-image srcs/phpmyadmin
docker build -qt influxdb-image srcs/influxdb
docker build -qt telegraf-image srcs/telegraf
docker build -qt grafana-image srcs/grafana
docker build -qt ftps-image srcs/ftps

echo "🌟 Apply *.yaml... 🌟"
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/ftps/ftps.yaml

echo "🌟 Launching dashboard... 🌟"
minikube dashboard &