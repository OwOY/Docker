<p align="center">
    <img src="https://user-images.githubusercontent.com/63274030/144020732-85ef54df-43bc-404a-9a0c-e31405afc786.png"/>
</p>

----  
## Installation
### Ubuntu
1. 確認有無docker
```
docker
```
2. 若有則清除
```
apt -y remove docker docker-engine docker.io
```
3. 若無則下載docker
```
apt -y install docker.io
```
### CentOS
1. 確認有無docker
```
docker
```
2. 清除docker
```
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
```
3. 下載安裝套件
```
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```
4. 下載docker
```
yum -y install docker-ce docker-ce-cli containerd.io
```

## Start
- docker status
```
systemctl status docker
```
- Start docker
```
systemctl start docker
```
- Enable docker
```
systemctl enable docker
```
## Package
- Search
```
docker search f'{package_name}'
```
- Install
```
docker pull f'{package_name}'
```
- Delete
```
docker rm f'{images_ID}'
```
- Check images
```
docker images
```

## USE  
- Check ps
```
docker ps
docker ps -a   (include stop process)
```
- Run
```
mariadb
docker run --name mariadb -e MYSQL_ROOT_PASSWORD="test" -p 3306:3306 -d docker.io/library/mariadb
docker exec -it <name-of the container|container-id> <shell>  # docker exec -it mariadb bash
```
## DockerCompose
[Docker-compose version](https://docs.docker.com/compose/compose-file/)
### Installation
- Install
```
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
- Change permission
```
chmod -x /usr/local/bin/docker-compose
```
- Create link
```
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
### Use
- Start&build
```
docker-compose up -d --build
```
>> -d run on background
