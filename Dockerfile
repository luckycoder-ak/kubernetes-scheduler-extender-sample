FROM golang:1.13-alpine as builder
ARG VERSION=0.0.1

ENV GO111MODULE=on
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

# build
WORKDIR /go/src/kubernetes-scheduler-extender-sample
COPY go.mod .
COPY go.sum .
RUN GO111MODULE=on go mod download
COPY . .
RUN go install -ldflags "-s -w -X main.version=$VERSION" kubernetes-scheduler-extender-sample

# runtime image
FROM gcr.io/google_containers/ubuntu-slim:0.14
COPY --from=builder /go/bin/kubernetes-scheduler-extender-sample /usr/bin/kubernetes-scheduler-extender-sample
ENTRYPOINT ["kubernetes-scheduler-extender-sample"]
