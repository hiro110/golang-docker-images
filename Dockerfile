FROM golang:1.18-alpine

ENV GO111MODULE auto

RUN apk add --update \
    && apk add git \
    && go install github.com/cosmtrek/air@v1.29.0 

RUN mkdir /go/src/app

WORKDIR /go/src/app

CMD ["air", "-c", ".air.toml"]