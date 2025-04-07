#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World , This is my first AWS project with Terraform</h1>" > /var/www/html/index.html
