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
