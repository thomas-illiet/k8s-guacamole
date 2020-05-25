#!/usr/bin/env bash
set -euo pipefail
jar cf branding.jar branding
docker build -t d2iqshadowbq/guacamole-branded:latest -t d2iqshadowbq/guacamole-branded:v1.1.0 .
docker push d2iqshadowbq/guacamole-branded:v1.1.0
