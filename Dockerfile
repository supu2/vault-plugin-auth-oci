FROM golang:1.22-alpine as builder
RUN apk add make gcc git bash musl-dev && git config --global --add safe.directory /go
COPY . . 
RUN make fmt && make dev

FROM alpine
COPY --from=builder /go/bin/vault-plugin-auth-oci /opt/oci