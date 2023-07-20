<img src='img/docker-compose.png' width='70%' style="display:block; margin:auto">

# docker-compose version  
## [version link](https://docs.docker.com/compose/compose-file/compose-file-v3/)
<br>

# Install
- Install docker-compose
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
<br>

# How to use
### 參數介紹
- -d  
背景執行
- --build  
建立image

### 常用指令
- 啟動
    ```
    docker-compose up -d --build # -d run on background
    ```
- 重啟
    ```
    docker-compose restart
    ```
- 關閉
    ```
    docker-compose down
    ```
# yml檔示範&說明
### [sample](sample/docker-compose.yml)
```
version: '3.8  # 定義docker-compose 版本號

services: # 建立service模組
  testService: # 定義service
    <!-- -------------------------------------- -->
    # 擇一使用，若無image，則可自訂義dockerfile Build Image
    image: test:latest # 使用的image
    build: 
        context: . # dockerfile路徑
        dockerfile: dockerfile # dockerfile名稱
    <!-- -------------------------------------- -->
    container_name: cAdvisor # 定義的container_name
    ports: # 對應開放port號
      - 8080:8080
    volumes: # mount路徑
      - /var/lib/docker/:/var/lib/docker:ro
    restart: always # 設定是否自動重啟
    environment: # 設定環境變數
      - TZ=Asia/Taipei
    env_file: xxx.cfg # 讀取環境變數檔案
    command: ["cat", "test.py"] # 執行指令
    networks: # 設定網域
      - apm

networks: # 設定網域
  apm: # 定義網域
    name: apm_network # 網域名稱
    driver: bridge # 連接方式
```

# Bonus
[docker-compose useful command](https://www.cnblogs.com/moxiaoan/p/9299404.html)