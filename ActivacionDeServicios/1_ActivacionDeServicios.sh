#!/bin/bash

# Iniciar UFW
echo "Iniciando UFW..."
service ufw start

# Habilitar UFW para que se inicie automáticamente al arrancar
echo "Habilitando UFW para iniciar automáticamente..."
service ufw enable

# Iniciar radvd
echo "Iniciando radvd..."
service radvd start

# Habilitar radvd para que se inicie automáticamente al arrancar
echo "Habilitando radvd para iniciar automáticamente..."
service radvd enable

# Reiniciar dhcpd
echo "Reiniciando dhcpd..."
systemctl restart dhcpd

# Iniciar dhcpd6.service
echo "Iniciando dhcpd6.service..."
systemctl start dhcpd6.service

# Habilitar dhcpd6.service para que se inicie automáticamente al arrancar
echo "Habilitando dhcpd6.service para iniciar automáticamente..."
systemctl enable dhcpd6.service

# Habilitar dhcpd para que se inicie automáticamente al arrancar
echo "Habilitando dhcpd para iniciar automáticamente..."
systemctl enable dhcpd

echo "Todas las acciones completadas."
