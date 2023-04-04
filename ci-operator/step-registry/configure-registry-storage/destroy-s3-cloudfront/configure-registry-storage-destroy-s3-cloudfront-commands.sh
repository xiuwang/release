#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

if [[ -f "${SHARED_DIR}/create_aws_bucket.tf" ]]; then
  echo "Destroy s3 cloudfront setting"
  cp "${SHARED_DIR}/create_aws_bucket.tf" /tmp && cd /tmp
  tar -xf "${SHARED_DIR}/s3_cloudfront_terraform_state.tar.xz"
  terraform init
  terraform destroy -refresh=false -auto-approve -no-color
else
  echo "This cluster does not set cloudfront"
fi
