FROM golang:1.18

ENV GO111MODULE auto

RUN apt update \
    && apt install -y git \
    && go install github.com/cosmtrek/air@v1.29.0  \
        github.com/uudashr/gopkgs/v2/cmd/gopkgs \
        github.com/ramya-rao-a/go-outline \
        github.com/nsf/gocode \
        github.com/acroca/go-symbols \
        github.com/fatih/gomodifytags \
        github.com/josharian/impl \
        github.com/haya14busa/goplay/cmd/goplay \
        github.com/go-delve/delve/cmd/dlv \
        golang.org/x/lint/golint \
        golang.org/x/tools/gopls

RUN mkdir /go/src/app

WORKDIR /go/src/app

CMD ["air", "-c", ".air.toml"]