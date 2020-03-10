# 우분투 18 외부 인터페이스 변경 후 dns 적용

apt-get install resolvconf
echo "nameserver 1.1.1.1" >> /etc/resolvconf/resolv.conf.d/head
echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf

# https://datawookie.netlify.com/blog/2018/10/dns-on-ubuntu-18.04/
