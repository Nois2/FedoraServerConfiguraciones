#!/bin/bash

# Este script automatiza la configuración e inicio de varios servicios en el sistema.

# Iniciar UFW (Firewall Uncomplicated)
echo "Iniciando UFW..."
ufw enable  # Inicia el Firewall Uncomplicated (UFW)

# Habilitar UFW para que se inicie automáticamente al arrancar
echo "Habilitando UFW para iniciar automáticamente..."
ufw --force enable  # Habilita UFW para iniciar automáticamente al arrancar

# Iniciar radvd (Router Advertisement Daemon)
echo "Iniciando radvd..."
service radvd start  # Inicia el servicio radvd

# Habilitar radvd para que se inicie automáticamente al arrancar
echo "Habilitando radvd para iniciar automáticamente..."
systemctl enable radvd  # Habilita radvd para iniciar automáticamente al arrancar

# Reiniciar dhcpd (Dynamic Host Configuration Protocol Daemon)
echo "Reiniciando dhcpd..."
systemctl restart dhcpd  # Reinicia el servicio dhcpd

# Iniciar dhcpd6.service
echo "Iniciando dhcpd6.service..."
systemctl start dhcpd6.service  # Inicia el servicio dhcpd6.service

# Habilitar dhcpd6.service para que se inicie automáticamente al arrancar
echo "Habilitando dhcpd6.service para iniciar automáticamente..."
systemctl enable dhcpd6.service  # Habilita dhcpd6.service para iniciar automáticamente al arrancar

# Habilitar dhcpd para que se inicie automáticamente al arrancar
echo "Habilitando dhcpd para iniciar automáticamente..."
systemctl enable dhcpd  # Habilita dhcpd para iniciar automáticamente al arrancar

# Verificar el estado de Asterisk
echo "Verificando el estado de Asterisk..."
systemctl status asterisk

# Iniciar Asterisk si no está en ejecución
echo "Iniciando Asterisk..."
systemctl start asterisk  # Inicia Asterisk si no está en ejecución

# Habilitar Asterisk para que se inicie automáticamente al arrancar
echo "Habilitando Asterisk para iniciar automáticamente..."
systemctl enable asterisk  # Habilita Asterisk para iniciar automáticamente al arrancar

# Recargar la configuración de Asterisk
echo "Recargando la configuración de Asterisk..."
asterisk -rx "core reload"

# Reiniciar Asterisk
echo "Reiniciando Asterisk..."
asterisk -rx "core restart now"

# Mostrar los módulos SIP cargados en Asterisk
echo "Mostrando los módulos SIP cargados en Asterisk..."
asterisk -rx "module show like sip"

# Cargar el módulo chan_sip.so en Asterisk
echo "Cargando el módulo chan_sip.so en Asterisk..."
asterisk -rx "module load chan_sip.so"

echo "Todas las acciones completadas."
