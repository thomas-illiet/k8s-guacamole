# TOMCAT WebApp 

Setting resources and limits should be coordinated with the JVM Heap

```yaml
  spec:
    containers:
      - name: guacamole-app
        image: guacamole/guacamole:v1.1.0
        resources:
          requests:
            memory: "64Mi"
            cpu: "250m"
          limits:
            memory: "256Mi"
            cpu: "750m"
```


To increase the JVM memory allocation and thread stack size for Tomcat we need to inject some extra ENVS

```shell
export JAVA_OPTS="-Xms512M -Xmx1024M"
export CATALINA_OPTS="-Xms512M -Xmx1024M"
```

The `catalina.sh` is launched from EXEC `start.sh`

```
##
## Starts Guacamole under Tomcat, replacing the current process with the
## Tomcat process. As the current process will be replaced, this MUST be the
## last function run within the script.
##
start_guacamole() {

    # Install webapp
    rm -Rf /usr/local/tomcat/webapps/${WEBAPP_CONTEXT:-guacamole}
    ln -sf /opt/guacamole/guacamole.war /usr/local/tomcat/webapps/${WEBAPP_CONTEXT:-guacamole}.war

    # Start tomcat
    cd /usr/local/tomcat
    exec catalina.sh run

}

start_guacamole
```
