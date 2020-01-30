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
2. 



## JS/TS

12h time to 24 time
```js
const to24htime = time => {
    const ten = i => (i < 10 ? '0' : '') + i;
    return time.replace(/([0-9]{1,2}):([0-9]{1,2})\s?(pm|am)/i, (...match) => {
      const [, hours, minutes, partOfDay] = match;
      let HH = +hours;
      let MM = +minutes;
      if (/am/i.test(partOfDay) && HH === 12 ) {
        HH -= 12;
      }
      if (/pm/i.test(partOfDay) && HH >= 1 && HH < 12) {
        HH += 12;
      }
      return `${ten(HH)}:${ten(MM)}`;
    });
  }
```
