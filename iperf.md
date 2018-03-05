```bash

yum install iperf

apt-get install iperf



iperf -s  # 서버모드 (TCP)
iperf -s -u # 서버모드 (UDP)

iperf -c 192.168.0.111  # 기본 테스트
iperf -c 192.168.0.111 -t 1  # 1초 간견으로 측정 결과값 출력
iperf -c 192.168.0.111 -P 5  # 동시에 3개 세션으로 측정
iperf -c 192.168.0.111 -d  # 동시에 양방향 측정

```
