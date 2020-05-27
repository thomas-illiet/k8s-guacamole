
## Guacamole App 

The dockerfile nukes the `GUACAMOLE_HOME_TEMPLATE` so you may need to the diff.

You can force it with GUACAMOLE_HOME instead of GUACAMOLE_HOME_TEMPLATE but name seems weird.

`/opt/guacamole/bin/start.sh`

```diff
31c31,34
< GUACAMOLE_HOME_TEMPLATE="$GUACAMOLE_HOME"
---
> # Set GUACAMOLE_HOME_TEMPLATE if not set
> if [ -z "$GUACAMOLE_HOME_TEMPLATE" ]; then
>   GUACAMOLE_HOME_TEMPLATE="$GUACAMOLE_HOME"
> fi
```