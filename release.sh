#!/bin/bash

set -eu
set -o pipefail

docker tag "$1" msjpq/nodebook:latest

docker push msjpq/nodebook:latest
