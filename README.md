kurento-group-call
==================

## @Author: Timothy Lam

Local Installation for kurento-group-call
==================

```
sudo apt-get update \
  && sudo apt-get install --no-install-recommends --yes \
     gnupg
```

```
DISTRO="xenial"  # KMS for Ubuntu 16.04 (Xenial)
DISTRO="bionic"  # KMS for Ubuntu 18.04 (Bionic)
```

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83
```

```
sudo tee "/etc/apt/sources.list.d/kurento.list" >/dev/null <<EOF
# Kurento Media Server - Release packages
deb [arch=amd64] http://ubuntu.openvidu.io/6.11.0 $DISTRO kms6
EOF
```

```
sudo service kurento-media-server start
sudo service kurento-media-server stop
```

```
To configure a STUN server in KMS, uncomment the following lines in the WebRtcEndpoint configuration file, located at /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini:
```

Checking installation 
==================

```
ps -ef | grep kurento-media-server

> nobody  1270  1  0 08:52 ?  00:01:00  /usr/bin/kurento-media-server
```

```
sudo netstat -tupan | grep kurento

> tcp6  0  0 :::8888  :::*  LISTEN  1270/kurento-media-server
```

Running kurento-group-call
==================

```
mvn -U clean spring-boot:run
```

```
mvn -U clean spring-boot:run -Dkms.url=ws://kms_host:kms_port/kurento
```

```
docker run --network=host -t --name <option> -p 8443:8888 <image>
```