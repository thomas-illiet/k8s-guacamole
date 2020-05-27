#!/usr/bin/env bash
set -euo pipefail
cd branding
jar cf ../branding.jar .
cd ..
docker build -t d2iqshadowbq/guacamole-branded:latest -t d2iqshadowbq/guacamole-branded:v1.1.0 .
docker push d2iqshadowbq/guacamole-branded:v1.1.0
