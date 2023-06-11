40.	nginx-install.sh
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum install nginx

# Enable the nginx service
sudo systemctl enable nginx

# Start the nginx service
sudo systemctl start nginx

# Check the nginx service status
sudo systemctl status nginx

# Rename default nginx conf file
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bkp

# Create nginx content file in default path and define proxy (reverse proxy) rules.
sudo vi /etc/nginx/nginx.conf and add the following lines
http://nginx ip add/myapp/
events{
worker_connections 1024;
}
http { keepalive_timeout 5;
upstream tomcatServers {
   keepalive 50;

server tomcat1 privateipaddress:8080;
server tomcat2 privateipaddress:8080;
server tomcat3 privateipaddress:8080;

}
server {
listen 80;
location / {
               proxy_set_header   X-Real-lp $remote_addr;
	        proxy_set_header   X-Forwarded-For
               $proxy_add_x_forwarded_for;
               proxy_set_header    X-Forwarded-Proto $scheme;
               proxy_set_header               Host $host;
               proxy_pass http://tomcatServers;
}
}
}
