#!/bin/bash

# Actualizar el repositorio de paquetes
sudo dnf update

# Instalar los paquetes necesarios
sudo dnf install -y httpd php php-mbstring php-gd php-mysqlnd php-fpm php-xml libxml2-devel libcurl-devel openssl-devel gcc gcc-c++ make redhat-lsb-core wget

# Descargar Asterisk 18.10.0
wget https://downloads.asterisk.org/pub/releases/18.10.0/asterisk-18.10.0.tar.gz

# Extraer el archivo descargado
tar -xvf asterisk-18.10.0.tar.gz

# Entrar al directorio de instalación de Asterisk
cd asterisk-18.10.0

# Configurar Asterisk
./configure

# Compilar Asterisk
make

# Instalar Asterisk (requiere privilegios sudo)
sudo make install

# Mensaje para recordar la configuración manual
echo "** ¡Atención! La instalación ha finalizado. Ahora debe configurar Asterisk manualmente. Consulte la documentación para más detalles: https://www.asterisk.org/community/documentation/ **"

exit 0
