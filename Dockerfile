FROM golang As builder

ENV GO111MODULE=on  \
    CGO_ENABLED=0  \
    GOOS=linux  \
    GOARCH=amd64  \
    GOPROXY=https://goproxy.cn,direct

WORKDIR /httpsever

COPY ./src /httpsever

RUN go build -o httpsever .



FROM scratch

COPY --from=builder /httpsever/*  /

ENTRYPOINT 8888

ENTRYPOINT ["/httpsever"]