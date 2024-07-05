FROM golang:alpine

ENV APP_PORT=8080

RUN mkdir app
COPY main.go app

CMD go run app/main.go