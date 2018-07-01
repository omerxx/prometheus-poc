FROM alpine

WORKDIR /prometheus

RUN apk update \
    && apk add ca-certificates wget \
    && wget https://github.com/prometheus/prometheus/releases/download/v2.3.1/prometheus-2.3.1.linux-amd64.tar.gz \
    && tar xvfz prometheus-*.tar.gz \
    && rm *.tar.gz \
    && mv prometheus-*/* . \
    && rmdir prometheus-*

COPY prometheus.yml /prometheus/prometheus.yml

CMD ["./prometheus", "--config.file=prometheus.yml"]
