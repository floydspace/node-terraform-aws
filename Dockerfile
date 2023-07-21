FROM cimg/python:3.8.16-node

LABEL image.namespace="floydocker" \
  image.id="node-terraform-aws" \
  version="python3.8-node18-tf1.4" \
  maintainer.name="Victor Korzunin" \
  description="Docker Image with Node.js 18, Python 3.8, Terraform 1.4.5 and AWS"

# MongoMemoryServer requires libcrypto.so.1.1, see https://github.com/nodkz/mongodb-memory-server/issues/480#issuecomment-1580929829
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
RUN sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb

# Install AWS CLI
RUN pip install awscli && \
  aws --version

# Install Terraform
ENV TERRAFORM_VERSION 1.4.5
RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  sudo unzip terraform.zip -d /usr/local/bin && \
  rm -f terraform.zip

ENTRYPOINT ["/bin/bash", "-c"]
