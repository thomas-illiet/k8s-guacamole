#!/usr/bin/env bash
set -euo pipefail
docker build -t d2iqshadowbq/guacd-helper:latest -t d2iqshadowbq/guacd-helper:v1.1.0 .
docker push d2iqshadowbq/guacd-helper:v1.1.0
