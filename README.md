# usefull-commands-snippets

## DEVOPS

#### get bandwidth between hosts [link](https://www.cyberciti.biz/faq/how-to-test-the-network-speedthroughput-between-two-linux-servers/)

#### change disk mount point [link](https://askubuntu.com/a/555292)

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
### find list of words in files with some lines before and after

```sh
// -B - before 4 lines
// -A - after 4 lines
// -n - show line number
// -Ff - take words from file
grep -B 4 -A 4 -nFf words.txt search_me.txt
```

### resize disk on proxmox vm

1. qm resize *VMID* *DISK_DEVICE_NAME(scsi0, etc)* +5G
2. parted # resize partion with parted and resizepart command
3. xfs_growfs <disk_name(local disk name)> # resise filesystem space

### list of rules iptables
```sh
iptables -t nat -L --line-numbers -n
```

### forward port using iptables

```sh
#                                                       ip to             port to               ip from       port from
iptables -t nat -A PREROUTING -t nat -i vmbr0 -p tcp -d 185.128.234.3 --dport 5913 -j DNAT --to 192.168.50.13:5901
```

### iptables [guide](https://help.ubuntu.ru/wiki/iptables) 

## MySQL

### get sizes of all tables in all databases

```mysql
SELECT table_schema AS "DB", table_name AS "Table",
ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)"
FROM information_schema.TABLES
WHERE table_schema = "database_name"
ORDER BY (data_length + index_length) DESC;
```

## backup and restore db with [xtrabackup](https://www.camil.org/hot-backups-and-restore-of-mysql-with-percona-xtrabackup/)

## JS/TS

- [12h time to 24 time](https://github.com/max-rollun-dev/usefull-commands-snippets/blob/master/to24htime.js)

## Optimize node.js app [link](https://proglib.io/p/sekrety-sozdaniya-proizvoditelnyh-veb-prilozheniy-na-express-js-2020-05-06)
