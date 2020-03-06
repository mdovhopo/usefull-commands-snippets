# usefull-commands-snippets

## DEVOPS

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

### run .gitlab-ci CI/CD script [locally](https://gitlab.com/gitlab-org/gitlab-runner/issues/312)

### replace in files

```sh
find . -type f  -exec sed -i '' -e 's/foo/bar/g' {} \;
```

### resize disk on proxmox vm

1. qm resize <VMID> + 5G
2. parted # resize partion with parted
3. xfs_growfs <disk_name> # resise filesystem space

## JS/TS

- [12h time to 24 time](https://github.com/max-rollun-dev/usefull-commands-snippets/blob/master/to24htime.js)
