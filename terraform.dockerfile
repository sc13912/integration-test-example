FROM alpine
MAINTAINER Sheng Chen

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
RUN unzip /tmp/terraform.zip -d /
RUN apk add ca-certificates

ENTRYPOINT [ "/terraform" ]

