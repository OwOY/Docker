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
docker search f'{image}'
```
- Install
```
docker pull f'{image}'
```
- Delete
```
docker rm f'{image}'
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
- Build
```
docker build -t {container_name} {file_dir}
```
- Run
```
mariadb
docker run --name mariadb -e MYSQL_ROOT_PASSWORD="test" -p 3306:3306 -d mariadb
docker exec -it <name-of the container|container-id> <shell>  # docker exec -it mariadb bash
```
>> --name 命名  
>> -p 指定對應port  
>> -d images name  
>> -e 環境變數設置  
>> --rm 關閉則刪除container  
>> -v 同步資料夾，若遇 volume 後資料夾 Permission denied ，後面加:z即可  EX : -v /foo:/foo:z
>> -w 將資料夾匯入container  
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
docker-compose up -d --build # -d run on background
```
### Close
```
docker-compose stop {docker-name} # Stop
docker-compose down 
```
# Bonus
[docker-compose useful command](https://www.cnblogs.com/moxiaoan/p/9299404.html)
