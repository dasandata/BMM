# CentOS 8 지원 종료로 인한 Mirror site 접속 불가 증상

### CentOS 8 EOS 로 인해 CentOS 8 Mirror site 가 vault 로 전환되어 Mirror site 를 못 찾아 발생되는 문제입니다.
### 지속적인 사용을 위해서는 CentOS 8 Stream 혹은 Rocky linux로 변경 해야 합니다.

## 1. 해결 방안
### Mirror site를 vault로 전환

```bash
# Mirror 주소 vault로 전환 작업
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
```