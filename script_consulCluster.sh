#!/bin/bash
echo "configurando el resolv.conf con cat"
cat <<TEST> /etc/resolv.conf
nameserver 8.8.8.8
TEST
#!------------------------------------------------------------
#!-Aprovicionando la maquina
#!------------------------------------------------------------
echo "Instalamos las herramientas de red"
sudo apt-get install net-tools
echo "Instalamos el gestor vim"
sudo apt-get install vim
echo "Instalamos lynx"
sudo apt-get install lynx -y
echo "Actualizamos los paquetes del sistema"
sudo apt-get update
echo "Instalamos python"
sudo apt install python3-pip -y
#!------------------------------------------------------------
sudo apt install nodejs -y
node -v
sudo apt install npm -y
npm -v
sudo apt-get update
sudo apt-get -y install git
git clone https://github.com/jeicsonzuniga/consulService
cd consulService/app1
npm install consul
npm install express
#!------------------------------------------------------------
#instalacion del agente de consul
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install consul -y
consul -v
consul agent -ui -dev -bind=192.168.100.3 -client=0.0.0.0 -data-dir=.
# http://192.168.100.3:8500/ui/dc1/services
#!------------------------------------------------------------
#node consulService/app1/indexService1.js 3041
#node consulService/app1/indexService2.js 3051
#node consulService/app1/indexService3.js 3061