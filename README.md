# edge-proxy
tengine based reverse proxy for auth and SSL termination

The edge-proxy runs on a public slave and expose a given service to the
outside world while requiring an password.

It can be run manually like this:

    docker run -p 2342:443 --rm mesosphere/edge-proxy moxy.marathon.mesos:8888 mesosphere:$(openssl passwd foobar23)

But preferably should be run via marathon, see [marathon.json.example](tree/marathon.json.example).
You need to add a crypted password to this file. To create that, run `openssl passwd`.

This image creates self-signed certificates if `/config/ssl.{key,crt}` is missing.
You can create your own image using this one as base image to add your own
ssl key. For that, create a Dockerfile like this:

```
FROM mesosphere/edge-proxy
ADD  my-ssl.key /config/ssl.key
ADD  my-ssl.crt /config/ssl.crt
```

Or you just use this repository and put `ssl.{key,crt}` into `config/`, build
the docker image (`docker build -t your/image .`) and push it to your registry.
