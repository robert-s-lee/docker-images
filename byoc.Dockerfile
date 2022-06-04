# test locally for syntax error by RUNning
# docker build -t grid-tf-aws:latest -f byoc.Dockerfile .

LABEL org.opencontainers.image.source https://github.com/robert-s-lee/docker-images

FROM python:3.8

# install TF AWS CLI
RUN apt-get update
# install the tools
RUN apt-get install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update 
RUN apt-get install terraform
RUN apt-get install git
RUN apt-get install -y jq
RUN apt-get install -y awscli

# mandatory for Grid.ai
WORKDIR /gridai/project
COPY . .
# mandatory with Dockerfile in Grid.ai  
RUN pip install --ignore-requires-python -v -r requirements.txt
