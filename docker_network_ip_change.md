# docker network IP 변경 방법
### docker network ip change 도커에서 디폴트 네트워크 환경 변경. 
### docker network 가 172.17.0.0/16 으로 되어있을때, 다른 내부 아이피 172.17.0.0/16 으로 통신이 안되는 라우팅 문제 발생
### 아래와 같이 IP 변경을 진행합니다.

```bash
# daemon.json은 docker설치시 자동으로 생성 되는 파일이 아닙니다.
# IP 변경을 위해 생성합니다.
vi /etc/docker/daemon.json

# 아래 내용을 입력 합니다.
{
    "bip": "192.168.5.1/16"
}
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}

# 만들어진 파일을 ohpc 이미지에 동일하게 적용합니다.
CHROOT=/opt/ohpc/admin/images/이미지 이름

cp /etc/docker/daemon.json  $CHROOT/etc/docker

# 변경 후 docker ip가 변경이 되었는지 확인 합니다.
 
```
