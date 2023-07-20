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
## Image
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
    docker rmi f'{image}'
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
    # sample > mariadb
    docker run -itd --name {container_name} -e MYSQL_ROOT_PASSWORD="test" -p {local_port}:{image_port} {image}
    ```
    ### 參數介紹
    - --name   
    命名  
    - -i  
    互動模式  
    - -t(--tty)  
    配置一個終端機  # 一般情況下會將 -it 寫在一起  
    - -d  
    背景執行
    - -p  
    指定對應port  
    - -e  
    環境變數設置  
    - -v  
    同步資料夾，若遇 volume 後資料夾 Permission denied ，後面加:z即可  EX : -v /foo:/foo:z
    - -w  
    將資料夾匯入container
    - --restart  
    重啟設定 ex: --restart=always
    - --network  
    使用網路環境
    -  --rm  
    關閉則刪除container 
- stop
    ```
    docker stop <container_name>
    ```
- remove
    ```
    docker rm <container_name>
    ```
### 進入container
- exec
    ```
    docker exec -it <name-of the container|container-id> <shell>  # docker exec -it mariadb bash
    ```
### 網路連接
- Exist container connect network
    ```
    docker network connect <network_name> <container>
    ```
- Exist container disconnect network
    ```
    docker network disconnect <network_name> <container>
    ```
### LOG查詢
- Check logs
    ```
    docker logs -f <container>
    ```
- Get log file
    ```
    cat /var/lib/docker/containers/<container_id>/<container_id>-json.log
    ```
- 查詢關鍵LOG
    ```
    docker logs -f <container> 2>&1 | grep '<keyword>'
    ```
### 檔案傳輸
- 上傳檔案到container
    ```
    docker cp <file_path> <container_name>:<container_target_path>
    ```
- 取出container檔案
    ```
    docker cp <file_path> <container_name>:<container_target_path>
    ```
