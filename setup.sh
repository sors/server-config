#! /bin/sh
# write here the copy / link script

# Install Monit
rm /etc/default/monit
ln /opt/arpu_lift/server-config/monit/monit

rm /etc/monit/conf.d
ln /opt/arpu_lift/server-config/monit/conf.d /etc/monit/conf.d -s
