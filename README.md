# usefull-commands-snippets


#### get list of ips in local network
```sh

sudo iptables -t nat -L --line-number -n

```

#### get ip of running docker container

```sh

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <image_name>

```
#### [ssh tunnel to remote database](https://support.cloud.engineyard.com/hc/en-us/articles/205408088-Access-Your-Database-Remotely-Through-an-SSH-Tunnel)

### ssh tunnel to remote docker container

1. get [container ip](https://github.com/max-rollun-dev/usefull-commands-snippets#get-ip-of-running-docker-container)
2. connect to container:
```sh
ssh -f -L [local-port]:[container-ip]:[exposed-container-ip] [remote-machine-user]@[remote-machine-ip] -N
```



## JS/TS

- [12h time to 24 time](https://github.com/max-rollun-dev/usefull-commands-snippets/blob/master/to24htime.js)
