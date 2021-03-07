mv /root/vsftpd.conf /etc/vsftpd

#addgroup -S ftps_group && adduser -S ftps_usr -G ftps_group -h /var/www
adduser -D ftps_usr -h /var/www
echo "ftps_usr:ftps" | chpasswd
#echo 'ftps_usr' >> /etc/vsftpd/vsftpd.userlist

# Grant rights to user
chmod -R 777 /var/www
#chown -R ftps_usr:ftps_group /var/www
chown -R ftps_usr /var/www

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf


## 수정한 부분
# 1. vsftpd.conf 파일의 위치
# 2. openrc boot 부분 위치 adduser이전에서 뒤로 -> openrc 부분 주석처리해봄
# 3. addgroup 없앰
# 4. 내껄로 conf바꾸니까 잘 됨(어디가 다른지 찾아보았다.)


## curl: (8) Got a 500 ftp-server response when 220 was expected 에러의 원인
# vsftpd.conf에서 140 line (userlist_enable=YES) 때문이었음
# 이 option을 쓰려면 ftps user를 생성한 후 /etc/vsftpd/vsftpd.userlist에 넣어주는게 필요한건가 해서 넣어봤는데 그래도 안되네...?
# 그리고 openrc 로 안돌리고 vsftpd server만 돌려줘도 잘 작동 된다.