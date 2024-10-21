# `/ext` EndPoint Port Check

>Checking Rancher Listening Ports


# How-to Run

1. Start a Docker installed Rancher
2. Run the following commands: `docker ps` & `docker exec <YOUR-CONTAINER-NAME-GOES-HERE> cat /proc/net/tcp /proc/net/tcp6 > network.log`

```sh
root@localhost:~# docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED             STATUS          PORTS                                                                      NAMES
cc7acbad1715   rancher/rancher:head   "entrypoint.sh --acm…"   About an hour ago   Up 14 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp   bold_jones
root@localhost:~# docker exec bold_jones cat /proc/net/tcp /proc/net/tcp6 > network.log
```

3. Check for port 6666 by running:

```sh
curl -s https://raw.githubusercontent.com/brudnak/ext-port-check/main/script.sh | bash -s network.log
```
