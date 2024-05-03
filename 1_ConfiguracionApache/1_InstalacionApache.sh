sudo dnf install httpd -y
sudo systemctl start httpd.service

#To enable auto start of HTTPD service at boot, execute the following command:
sudo systemctl enable httpd.service
