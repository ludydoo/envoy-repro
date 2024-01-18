FROM golang:1.16-alpine
WORKDIR /app
RUN cat <<EOF > go.mod
module app
go 1.20
EOF
COPY main.go .
RUN go build -o /go/bin/app
EXPOSE 8080
CMD ["/go/bin/app"]