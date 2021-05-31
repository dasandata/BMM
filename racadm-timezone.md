# racadm timezone settings cli

## 원격지 example

```bash
원격지 command line

racadm --nocertwarn -r 192.168.0.x -u root -p 123456qwer!

example !

racadm --nocertwarn -r 192.168.0.119 -u root -p 123456qwer! $COMMAND

```


## iDRAC Timezone 설정 확인
```bash
racadm get iDRAC.Time.Timezone
```
```bash
output line !

[Key=iDRAC.Embedded.1#Time.1]
Timezone=CST6CDT

```



## iDRAC Timezone 설정 변경하기
```bash
racadm set iDRAC.Time.Timezone Asia/Seoul
```
```bash
output line !

[Key=iDRAC.Embedded.1#Time.1]
Object value modified successfully
```



## iDRAC Timezone 설정 적용 된 값 확인 
```bash
racadm get iDRAC.Time.Timezone
```
```bash
output line !

[Key=iDRAC.Embedded.1#Time.1]
Timezone=Asia/Seoul
```
