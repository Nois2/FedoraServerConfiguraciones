#!/bin/bash

# Iniciar UFW (Firewall Uncomplicated)
echo "Iniciando UFW..."
ufw enable      # Cambiado de 'service ufw start' a 'ufw enable', ya que 'ufw start' e 'ufw enable' son comandos válidos para iniciar y habilitar UFW respectivamente

# Habilitar UFW para que se inicie automáticamente al arrancar
echo "Habilitando UFW para iniciar automáticamente..."
ufw --force enable      # Añadido '--force' para forzar la habilitación de UFW automáticamente al inicio

# Iniciar radvd (Router Advertisement Daemon)
echo "Iniciando radvd..."
service radvd start     # Mantenido como está, iniciando el servicio radvd

# Habilitar radvd para que se inicie automáticamente al arrancar
echo "Habilitando radvd para iniciar automáticamente..."
systemctl enable radvd  # Cambiado de 'service radvd enable' a 'systemctl enable radvd', para habilitar radvd automáticamente al arrancar

# Reiniciar dhcpd (Dynamic Host Configuration Protocol Daemon)
echo "Reiniciando dhcpd..."
systemctl restart dhcpd     # Cambiado de 'systemctl restart dhcpd' para reiniciar el servicio dhcpd

# Iniciar dhcpd6.service
echo "Iniciando dhcpd6.service..."
systemctl start dhcpd6.service     # Mantenido como está, iniciando el servicio dhcpd6.service

# Habilitar dhcpd6.service para que se inicie automáticamente al arrancar
echo "Habilitando dhcpd6.service para iniciar automáticamente..."
systemctl enable dhcpd6.service    # Cambiado de 'service dhcpd6 enable' a 'systemctl enable dhcpd6.service', para habilitar dhcpd6.service automáticamente al arrancar

# Habilitar dhcpd para que se inicie automáticamente al arrancar
echo "Habilitando dhcpd para iniciar automáticamente..."
systemctl enable dhcpd     # Cambiado de 'service dhcpd enable' a 'systemctl enable dhcpd', para habilitar dhcpd automáticamente al arrancar

# Verificar el estado de Asterisk
echo "Verificando el estado de Asterisk..."
systemctl status asterisk

# Iniciar Asterisk si no está en ejecución
echo "Iniciando Asterisk..."
systemctl start asterisk

# Habilitar Asterisk para que se inicie automáticamente al arrancar
echo "Habilitando Asterisk para iniciar automáticamente..."
systemctl enable asterisk

# Mostrar los módulos SIP cargados en Asterisk
echo "Mostrando los módulos SIP cargados en Asterisk..."
asterisk -rx "module show like sip"

# Cargar el módulo chan_sip.so en Asterisk
echo "Cargando el módulo chan_sip.so en Asterisk..."
asterisk -rx "module load chan_sip.so"

echo "Todas las acciones completadas."
