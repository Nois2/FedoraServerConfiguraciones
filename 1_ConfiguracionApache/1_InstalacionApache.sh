#!/bin/bash

# Instalar Apache
sudo dnf install -y httpd

# Iniciar Apache
sudo systemctl start httpd

# Habilitar Apache para que se inicie automáticamente al arrancar
sudo systemctl enable httpd

# Verificar el estado de Apache
sudo systemctl status httpd

# Habilitar UFW
sudo systemctl start ufw

# Configurar UFW para permitir tráfico HTTP (puerto 80) y HTTPS (puerto 443)
sudo ufw allow http
sudo ufw allow https

# Verificar las reglas de UFW
sudo ufw status
