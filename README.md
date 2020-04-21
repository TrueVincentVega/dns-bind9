## drpesojr/dns-bind9

* [GitHub](https://github.com/TrueVincentVega/dns-bind9 ) - view the source for this repositorie.

Image is based on ubuntu:18.04. This image build support multiple architectures such as `arm64`. 

BIND (Berkeley Internet Name Domain) is the open and most common implementation of a DNS server that provides DNS-to-IP address translation and vice versa. The executable BIND server daemon is named.

## Usage

Here are some example snippets to help you get started creating a container. The image was going to run in host mode. In order not to forward port 53 from the container to the localhost. All configuration files are forwarded to a localhost in directory **/home/user/docker/bind**. The time and localzone in the container corresponds to the time and localzone of your localhost. For configure DNS service BIND9 read the service manuals.

### docker script

```dns-bind9.sh
#!/bin/bash
docker run -d -it \
    --name="dns-bind9" \
    --restart="unless-stopped" \
    --network="host" \
    -P \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /home/user/docker/bind:/etc/bind \
    -v /var/log/named:/var/log/named \
    dns-bind9:latest
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate external:internal respectively. For example, -P  would expose all exposed in build image ports from the container ( 53 and 53/udp). 
| Parameter | Function |
| :----: | --- |
| `-P` | Expose all exposed in build image ports from the container ( 53 and 53/udp). |
| `--network="host"` | Run container in a host mode. |
| `-v /etc/timezone:/etc/timezone:ro` | Timezone in container from localhost. |
| ` -v /etc/localtime:/etc/localtime:ro` | Localtime in container from localhost. |
| `-v /home/user/docker/bind:/etc/bind` | Configuration files of service bind9. |
| `-v /var/log/named:/var/log/named` | Log files of service bind9. |

## Support Info

* Shell access whilst the container is running: `docker exec -it dns-bind9 /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f dns-bind9`

## Via Docker Run/Create
* Update the image: `docker pull drpesojr/dns-bind9`
* Stop the running container: `docker stop dns-bind9`
* Delete the container: `docker rm dns-bind9`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start dns-bind9`
* You can also remove the old dangling images: `docker image prune`
