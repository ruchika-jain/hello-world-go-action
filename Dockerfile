

FROM golang:alpine AS base
RUN apk add git
WORKDIR /app
COPY . .

RUN go build -o ./out .

FROM alpine AS final

WORKDIR /app
COPY --from=base /app/out .

CMD [ "./out" ]
