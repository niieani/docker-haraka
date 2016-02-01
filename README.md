# docker-haraka
Dockerfile for Haraka designed for easy local plugin development

# Usage

## Build

```bash
$ docker-compose build
```

## Start

```bash
$ docker-compose up # -d for background
```

## Create plugin `plugin_name`
```bash
$ docker run -it --rm -v $(pwd)/haraka:/haraka haraka -c /haraka -p plugin_name
```

## Testing
```bash
$ docker exec -it mail_haraka_1 swaks -t target@email.com -f from@email.com --auth CRAM-MD5 --auth-user youruser --server localhost
```
