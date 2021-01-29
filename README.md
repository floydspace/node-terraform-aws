# node-terraform-aws
Terraform and AWS CLI installed docker image based on NodeJS environment

[![Dockerhub badge](http://dockeri.co/image/floydocker/node-terraform-aws)](https://hub.docker.com/r/floydocker/node-terraform-aws)

This Docker image is intended for use with [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) and [AWS CodeBuild](https://aws.amazon.com/codebuild).

This image is based on node:14-alpine and has Terraform 0.14.5, the AWS CLI and Yarn installed (see Dockerfile for all other installed utilities).
