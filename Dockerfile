FROM golang:1.18-alpine

ENV GO111MODULE auto

RUN apk add --update \
    && apk add git \
    && go install github.com/cosmtrek/air@v1.29.0 
    # && go install github.com/cosmtrek/air@latest \
    # && go install golang.org/x/tools/gopls@latest \
    # && go get -u golang.org/x/tools/gopls \
    # github.com/ramya-rao-a/go-outline

RUN mkdir /go/src/app

WORKDIR /go/src/app

CMD ["air", "-c", ".air.toml"]