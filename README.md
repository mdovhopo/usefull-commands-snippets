# usefull-commands-snippets


#### get list of ips in local network
```sh

sudo iptables -t nat -L --line-number -n

```

### get ip of running docker container

```sh

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <image_name>

```
