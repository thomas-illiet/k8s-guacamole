## Add Oauth2 to better protect your Guacamole instance

*SNIP FROM ORIGINAL REPO*

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
