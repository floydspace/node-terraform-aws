FROM node:16-alpine

LABEL image.namespace="floydocker" \
  image.id="node-terraform-aws" \
  version="2.1.0" \
  maintainer.name="Victor Korzunin" \
  description="Docker Image with Node.js 16, Terraform 1.2.8 and AWS"

RUN apk add --no-cache \
  python3 \
  py-pip \
  py-setuptools \
  ca-certificates \
  openssl \
  groff \
  less \
  bash \
  curl \
  jq \
  git \
  zip && \
  pip install --no-cache-dir --upgrade pip pipenv awscli && \
  aws configure set preview.cloudfront true

ENV TERRAFORM_VERSION 1.2.8

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform.zip -d /usr/local/bin && \
  rm -f terraform.zip

ENTRYPOINT ["/bin/bash", "-c"]
