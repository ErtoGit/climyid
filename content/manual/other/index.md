---
title: 'Other Frameworks'
date: 2020-02-01T15:14:39+08:00
draft: false
weight: 1
summary: Manual untuk frameworks lain.
---

## Perintah Umum

### Restart webmin
```bash
/etc/init.d/webmin restart
```

### Restart vps
```bash
reboot
```

### Delete all lines in vim
```bash
dG
```

### Force delete a folder
```bash
rm -r -f /path/
```

### Jika bermasalah dengan LE cert yg kosong pada Webmin
Cek jika ada file `https://github.com/webmin/webmin/blob/master/webmin/webmin-lib.pl` di `/usr/share/webmin/webmin/`

### Force HTTPS via htaccess
```bash
#Uncomment RewriteEngine if never declare
#RewriteEngine on

#Using permanent redirect 301
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]

#Using temporary redirect 307
RewriteCond %{HTTPS} !=on
RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [R=307,NE,L]

#Redirect all HTTP traffic to a domain
RewriteCond %{SERVER_PORT} 80 
RewriteRule ^(.*)$ https://www.yourdomain.com/$1 [R,L]

#Redirect specific domain to use HTTPS
RewriteCond %{HTTP_HOST} ^yourdomain\.com [NC] 
RewriteCond %{SERVER_PORT} 80 
RewriteRule ^(.*)$ https://www.yourdomain.com/$1 [R,L]
```

### Check file yg paling besar dlm 1 folder
```bash
du -a /var | sort -n -r | head -n 10
```
> Referensi: 
https://bit.my.id/bo7Lzhhr

### Empty specific file content
```bash
: > access.log
# OR 
true > access.log
```
> Referensi: 
https://bit.my.id/gAoo527l

### Commands to check listening ports
```bash
lsof -n -P | grep LISTEN
lsof -i tcp | grep nomor-port  # <-- paling gampang
netstat -vatn
netstat -tulpn
```

### Cari tahu yg menggunakan port
```bash
fuser nomor_port/tcp  # <-- catat nomor PID
lsof -i tcp | grep nomor-PID  # <-- cari tahu service mana yg pake nomor port ybs
fuser -k nomor_port/tcp
```

### Reset mssql-server listening ports
```bash
service mssql-server status  # <-- cek nomor PID
service mssql-server stop
fuser -k nomor_port/tcp
```

### Set timezone in PHP.ini
```bash
vi /etc/php.ini
```

```ini
[Date]
; Defines the default timezone used by the date functions
; http://php.net/date.timezone
date.timezone = 'Asia/Makassar'
```

```bash
service httpd restart
```

### How to use LE on Vesta login
```bash
mv /usr/local/vesta/ssl/certificate.crt /usr/local/vesta/ssl/unusablecer.crt
mv /usr/local/vesta/ssl/certificate.key /usr/local/vesta/ssl/unusablecer.key
ln -s /home/admin/conf/web/ssl.server1.flaunt7.com.crt /usr/local/vesta/ssl/certificate.crt
ln -s /home/admin/conf/web/ssl.server1.flaunt7.com.key /usr/local/vesta/ssl/certificate.key
service vesta restart
```

### How to use LE on Hestia login
```bash
ln -s /home/admin/conf/web/ssl.server1.flaunt7.com.crt /usr/local/hestia/ssl/certificate.crt
ln -s /home/admin/conf/web/ssl.server1.flaunt7.com.key /usr/local/hestia/ssl/certificate.key
service hestia restart
```

### Change TCP MSSQL port (not working, failed to connect)
```bash
/opt/mssql/bin/mssql-conf set network.tcpport <new_tcp_port>
systemctl restart mssql-server
```

### Instal `php71` & `php72` di virtualmin
```bash
yum install centos-release-scl
yum install rh-php72 rh-php72-php-mysqlnd rh-php72-php-mbstring rh-php72-php-imagick
systemctl restart httpd
```

