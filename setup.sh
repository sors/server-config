#! /bin/sh
# write here the copy / link script

# Install Monit
rm /etc/default/monit
ln /opt/arpu_lift/server-config/monit/monit

rm /etc/monit/conf.d
ln /opt/arpu_lift/server-config/monit/conf.d /etc/monit/conf.d -s

# Install nginx
rm /opt/nginx/conf/nginx.conf
ln /opt/arpu_lift/server-config/nginx/nginx.conf /opt/nginx/conf/nginx.conf -s
ln /opt/arpu_lift/server-config/nginx/htpasswrd  /opt/nginx/conf/htpasswd -s
ln /opt/arpu_lift/dev_tools/public /opt/arpu_lift/dev_tools/dev -s


