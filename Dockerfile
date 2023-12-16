# Use the official Golang image as a base image
FROM golang:alpine

# Install git for fetching dependencies
RUN apk update && apk add --no-cache git

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum to the working directory
COPY go.mod .
COPY go.sum .

# Download and install dependencies
RUN go mod download

# Copy the entire project to the working directory
COPY . .

# Build the Go application
RUN go build -o binary

# Expose the port on which the application will run (if needed)
EXPOSE 8080

# Command to run the executable
ENTRYPOINT ["./binary"]
