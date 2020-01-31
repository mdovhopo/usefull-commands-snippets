# usefull-commands-snippets


#### get list of ips in local network
```sh

sudo iptables -t nat -L --line-number -n

```

#### get ip of running docker container

```sh
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <image_name>
```

### ssh tonnel to local server on remote machine

```sh
ssh -f [remote-machine-user]@[remote-machine-ip] -L [local-port]:[server-ip]:[server-port] -N
```


## JS/TS

- [12h time to 24 time](https://github.com/max-rollun-dev/usefull-commands-snippets/blob/master/to24htime.js)
