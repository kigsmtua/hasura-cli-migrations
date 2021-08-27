FROM ubuntu:latest

RUN apt-get update -y && apt-get install -y curl

RUN adduser --system --home /hasura --disabled-password --group hasura

WORKDIR /hasura

USER hasura

COPY run.sh /hasura/

RUN curl -L https://github.com/hasura/graphql-engine/raw/master/cli/get.sh | INSTALL_PATH=/hasura  VERSION=v1.3.3 bash

CMD /hasura/run.sh
