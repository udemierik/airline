FROM alpine
RUN apk add bash vim
COPY home /root
ENTRYPOINT bash
