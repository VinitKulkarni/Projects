# Stage 1: Build the Go app
FROM golang:1.21 AS builder

WORKDIR /app
COPY . .

# Force static build
RUN go mod init hello && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Stage 2: Run the Go app
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/main .

EXPOSE 8080
CMD ["./main"]
