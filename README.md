# docker-haraka
Dockerfile for Haraka designed for easy local plugin development

# Usage

## Install 

```bash
$ docker run -it --rm -v $(pwd)/haraka:/haraka haraka -i /haraka
```

## Start on port 2525

```bash
$ docker run -it --rm -p 2525:25 -v $(pwd)/haraka:/haraka haraka -c /haraka
```

## Create plugin
```bash
$ docker run -it --rm -v $(pwd)/haraka:/haraka haraka -c /haraka -p plugin_name
```