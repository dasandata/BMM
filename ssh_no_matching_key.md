## SSH 접속시 No matching Key 관련 오류 해결방안

### 원인 : OpenSSH 7.0 버전 이상에서 키 교환 알고리즘이 기본 off 상태일때 발생
### 에러 문구 : Unable to negotiate with IP주소 port 포트번호: no matching host key type found. Their offer: 호스트이름
### 해결 방법 : 키 생성 후 키 알고리즘을 접속할 IP에 전송 및 ssh config 파일 변경

#### OpenSSH 버전 확인
```
ssh -V
```

#### 1. 자신의 키 생성
```
ssh-keygen -t rsa
```
#### 2. 생성된 키값을 접속할 IP에 전송
```
ssh -oHostKeyAlgorithms=+접속할 호스트네임  계정명@접속할 IP

ex)
ssh -oHostKeyAlgorithms=+centos7 dasan@192.168.0.1
```
#### 3. ssh config 파일 변경
##### 3.1. 사용자 별 설정파일 위치 (기존에 생성되어있지 않음)
```
~/.ssh/config
touch .ssh/config
```

##### 3.2. .ssh/config에 내용 추가/
```
Host 접속 호스트네임
KexAlgorithms +호스트네임

ex ) 
echo "Host centos7" >> .ssh/config
echo "HostKeyAlgorithms +centos7" >> .ssh/config
cat .ssh/config
```