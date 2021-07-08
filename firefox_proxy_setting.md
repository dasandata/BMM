# Firefox에 Proxy 설정을 통해 기존 X Forwarding 보다 편리하게 사용 가능합니다.

## Firefox 실행 후 설정
![MicrosoftTeams-image](https://user-images.githubusercontent.com/65653117/124881359-347f8800-e00a-11eb-9756-b9f9c88e4dbb.png)

## Proxy 설정
![MicrosoftTeams-image (1)](https://user-images.githubusercontent.com/65653117/124881108-ef5b5600-e009-11eb-90ba-8b4be31c2a6f.png)

## 위 설정을 마친 후 SSH 접속 방법
```
ssh -p1234 -XYC -D9999 sonic@IPADDRESS
```

## 위와 같이 ssh 접속 후 firefox 에서 X Forwarding을 사용하면 편리하게 사용 할 수 있습니다.
## ssh 접속이 끊길 시 firefox 역시 끊기는 점 유념하셔야 합니다.