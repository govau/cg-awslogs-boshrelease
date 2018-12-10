#!/bin/bash

set -e
set -x

TARGET=${TARGET:-local}

fly validate-pipeline --config pipeline.yml

fly --target ${TARGET} set-pipeline --config pipeline.yml --pipeline create-boshrelease-awslogs

fly -t ${TARGET} unpause-pipeline -p create-boshrelease-awslogs