#!/bin/bash

# Este script automatiza la configuración e inicio de varios servicios en el sistema.

# Iniciar radvd (Router Advertisement Daemon)
echo "Iniciando radvd..."
systemctl start radvd  # Inicia el servicio radvd

# Reiniciar dhcpd (Dynamic Host Configuration Protocol Daemon)
echo "Reiniciando dhcpd..."
systemctl restart dhcpd  # Reinicia el servicio dhcpd

# Iniciar dhcpd6.service
echo "Iniciando dhcpd6.service..."
systemctl start dhcpd6.service  # Inicia el servicio dhcpd6.service

# Iniciar Asterisk
echo "Iniciando Asterisk..."
systemctl start asterisk  # Inicia Asterisk

# Iniciar servidor Apache
echo "Iniciando servidor Apache..."
systemctl start httpd  # Inicia el servidor Apache

# Habilitar radvd para que se inicie automáticamente al arrancar
echo "Habilitando radvd para iniciar automáticamente..."
systemctl enable radvd  # Habilita radvd para iniciar automáticamente al arrancar

# Habilitar dhcpd6.service para que se inicie automáticamente al arrancar
echo "Habilitando dhcpd6.service para iniciar automáticamente..."
systemctl enable dhcpd6.service  # Habilita dhcpd6.service para iniciar automáticamente al arrancar

# Habilitar dhcpd para que se inicie automáticamente al arrancar
echo "Habilitando dhcpd para iniciar automáticamente..."
systemctl enable dhcpd  # Habilita dhcpd para iniciar automáticamente al arrancar

# Habilitar Asterisk para que se inicie automáticamente al arrancar
echo "Habilitando Asterisk para iniciar automáticamente..."
systemctl enable asterisk  # Habilita Asterisk para iniciar automáticamente al arrancar

# Habilitar servidor Apache para que se inicie automáticamente al arrancar
echo "Habilitando servidor Apache para iniciar automáticamente..."
systemctl enable httpd  # Habilita servidor Apache para iniciar automáticamente al arrancar

# Verificar el estado de los servicios
echo "Verificando el estado de los servicios..."
systemctl status radvd
systemctl status dhcpd
systemctl status dhcpd6.service
systemctl status asterisk
systemctl status httpd

# Configuración de Asterisk
echo "Configurando Asterisk..."
systemctl start asterisk
systemctl enable asterisk
asterisk -rx "module show like sip"
asterisk -rx 'module load chan_sip.so'
asterisk -rx 'sip show peers'

echo "Todas las acciones completadas."
