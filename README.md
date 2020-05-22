# K8S Guacamole

![banner](meta/k8s-guacamole-banner.png)

Apache Guacamole is a clientless HTML5 web based remote desktop gateway that makes it easy to access remote servers and desktops through a web browser. It supports standard protocols like VNC, RDP, and SSH.

In this repository, we are going to learn how to setup Guacamole web-based remote desktop access tool on Kubernetes server.

Kubernetes is fast developing and this deployment will target `kubernetes 1.16.x`.

You can see below a simple demo of Guacamole :

[![Watch the video](meta/k8s-guacamole-preview.png)](https://youtu.be/AjuHJHtd4zU)

## Image Usage

Images are fetched from Docker's image repo:

Guacamole: 1.1.0

* https://hub.docker.com/u/guacamole - Base

* https://hub.docker.com/r/guacamole/guacamole  - guacamole/guacamole:1.1.0
* https://hub.docker.com/r/guacamole/guacd  - guacamole/guacd:1.1.0

MariaDB (MySQL Clone): 10.5.3

* https://hub.docker.com/_/mariadb/ - mariadb:10.5.3

## Install on D2iQ Konvoy

https://d2iq.com/solutions/ksphere/konvoy#request-free-trial

Enable you cluster: `konvoy up -y`

### Install

`kubectl apply -f manifests`

Example: https://a39306ab925214a18bbedd2ded635581-1473587611.us-east-1.elb.amazonaws.com/guacamole/guacamole/#/

## Automatic Initializing the MySQL database

The initcontainer on `guacamole-app` automatically applies the standard schema, and default user `guacadmin`.

## Troubleshooting

You can deploy pod  `manifest/90-guacd-helper-pod.yaml` which you can use to sql into the backend if needed.


```bash
$> kubectl exec -it guacamole-helper --namespace guacamole -- /bin/sh
container $>  $$PROFIT$$
```

## Add Oauth2 to better protect your Guacamole instance

If you want to add a second authentication to better protect your Guacamole instance, you must first add the Oauth2 configuration files available in the following github repository [k8s-oauth2-proxy](https://github.com/thomas-illiet/k8s-oauth2-proxy).

Add the following annotations in your ingress configuration to redirect unauthenticated users to your oauth2 proxy.

```bash
nginx.ingress.kubernetes.io/auth-url: "https://$host/oauth2/auth"
nginx.ingress.kubernetes.io/auth-signin: "https://$host/oauth2/start"
```

To complete oauth2 configuration, add the following code to your input configuration.

```bash
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: guacamole-oauth2
  namespace: guacamole
spec:
  tls:
  - hosts:
    - sc6rffd3d5.netboot.fr
    secretName: guacamole-netboot-fr-tls
  rules:
  - host: sc6rffd3d5.netboot.fr
    http:
      paths:
      - path: /oauth2
        backend:
          serviceName: guacamole-oauth2
          servicePort: guacamole-oauth2
```
