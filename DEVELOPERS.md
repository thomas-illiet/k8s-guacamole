# Building the `guacd-helper` docker image

## Build

```shell
docker build -t d2iqshadowbq/guacd-helper:latest -t d2iqshadowbq/guacd-helper:v1.1.0 .
docker push d2iqshadowbq/guacd-helper:v1.1.0
```

## Shell into container

```shell
docker run -it d2iqshadowbq/guacd-helper:v1.1.0 /bin/bash
```

## TODO

* Add Service Account and Bindings
* Create Related HELM chart
