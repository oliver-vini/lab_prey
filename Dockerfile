FROM alpine:latest
RUN apk add --no-cache curl
RUN apk add --no-cache --upgrade bash
RUN mkdir /script
COPY . .
CMD [ "bash" ]