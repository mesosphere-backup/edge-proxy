# edge-proxy
tengine based reverse proxy for auth and SSL termination

The edge-proxy runs on a public slave and expose a given service to the
outside world while requiring an password.

It can be run manually like this:

    docker run -p 2342:80 --rm mesosphere/edge-proxy moxy.marathon.mesos:8888 mesosphere:$(openssl passwd foobar23)

But preferably should be run via marathon, see [marathon.json](tree/marathon.json).
