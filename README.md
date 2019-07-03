# k8S Guacamole

![banner](assets/k8s-guacamole-banner.png)

Apache Guacamole is a clientless remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH.

We call it clientless because no plugins or client software are required.

## How to

This configuration launch one deployment for Guacd on serviceport 4822 and one deployment for Guacamole on serviceport 8080.

### Prerequisite

This Guacamole configuration use [cert-manager](https://github.com/thomas-illiet/k8s-infrastructure/tree/master/config/cert-manager) and [ingress-nginx](https://github.com/thomas-illiet/k8s-infrastructure/tree/master/config/ingress-nginx), the configuration of these are stored in my [kubernetes infrastructure](https://github.com/thomas-illiet/k8s-infrastructure/) repository.

### Initializing the MySQL database

If your database is not already initialized with the Guacamole schema, you will need to do so prior to using Guacamole. A convenience script for generating the necessary SQL to do this is included in the Guacamole image.

run this command in your kubernetes worker to generate a SQL script :

```bash
docker exec -i <APP CONTAINER ID> /opt/guacamole/bin/initdb.sh --mysql > /tmp/initdb.sql
```

And import `initdb.sql` to mariadb docker intance with the following command :

```bash
docker exec -i <DB CONTAINER ID> mysql -uguacamole -p<DB PASSWORD> guacamole < /tmp/test.sql
```