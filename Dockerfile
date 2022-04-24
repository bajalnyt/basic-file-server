FROM golang:1.17.6-alpine3.15 as builder

WORKDIR /app

COPY . .
# Build the binary.
RUN go build -v -o /bin/myapp main.go

# minimize image
FROM alpine:latest

# copy only the executable
COPY --from=builder /bin/myapp /
COPY --from=builder /app/ui ui
# Run the web service on container startup.
CMD ["/myapp"]
