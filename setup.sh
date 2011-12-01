#! /bin/sh
# write here the copy / link script

echo "Starting server configuration script..."

# Setup nginx
echo "Setup nginx"
rm /opt/nginx/conf/nginx.conf
ln /opt/arpu_lift/server-config/nginx/nginx.conf /opt/nginx/conf/nginx.conf -s
ln /opt/arpu_lift/server-config/nginx/htpasswrd  /opt/nginx/conf/htpasswd -s
ln /opt/arpu_lift/dev_tools/public /opt/arpu_lift/dev_tools/dev -s

# Setup mysql
echo "Setup mysql"
rm /etc/mysql/my.cnf
ln /opt/arpu_lift/server-config/mysql/my.cnf /etc/mysql/my.cnf -s
echo -n "Enter replication ID for mysql: "
read repid
sed -i "s/SERVERID/$repid/g" /opt/arpu_lift/server-config/mysql/my.cnf
echo "Updated mysql conf with id: $repid"

# Setup ssmtp
echo "Setup ssmtp"
rm /etc/ssmtp/ssmtp.conf 
ln /opt/arpu_lift/server-config/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf -s
sed -i "s/MYHOSTNAME/`hostname`/g" /opt/arpu_lift/server-config/ssmtp/ssmtp.conf
rm /etc/ssmtp/revaliases 
ln  /opt/arpu_lift/server-config/ssmtp/revaliases /etc/ssmtp/revaliases -s

# Copy ssh keys
echo "Copy ssh keys"
mkdir /root/.ssh
cp /opt/arpu_lift/server-config/ssh/* /root/.ssh

# Setup Monit
echo "Setup monit"
rm /etc/default/monit
ln /opt/arpu_lift/server-config/monit/monit

rm /etc/monit/conf.d
ln /opt/arpu_lift/server-config/monit/conf.d /etc/monit/conf.d -s

monit monitor all
monit restart all

echo "Finished server configuration"
