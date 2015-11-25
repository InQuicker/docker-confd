# docker-confd

This is a Docker image for [confd](https://github.com/kelseyhightower/confd). All it does is wrap the confd binary in a Docker image so it can be easily run as a container.

The path `/etc/confd` inside the container is a volume where you should mount your confd configuration files and templates.

## Usage

Start up etcd:

``` bash
export HOST_IP=192.168.1.100 # replace this IP with the IP of the machine running Docker
docker run -d -p 2379:2379 -p 2380:2380 quay.io/coreos/etcd:v2.2.2 -advertise-client-urls http://$HOST_IP:2379 -listen-client-urls http://0.0.0.0:2379 -initial-advertise-peer-urls http://$HOST_IP:2380 -listen-peer-urls http://0.0.0.0:2380 -initial-cluster default=http://$HOST_IP:2380
```

``` bash
docker run -v /etc/confd:/etc/confd inquicker/confd -node $HOST_IP:2379
```

The above example assumes that your confd configuration files and templates are in the host directories `/etc/confd/conf.d` and `/etc/confd/templates`, respectively.

## License

[MIT](http://opensource.org/licenses/MIT)
