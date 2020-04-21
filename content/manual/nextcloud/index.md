---
title: 'Nextcloud'
date: 2020-02-15T15:14:39+08:00
draft: false
weight: 1
summary: Manual untuk `nextcloud`.
---

**Nextcloud** is an open source, self-hosted file share and communication platform. Access & sync your files, contacts, calendars & communicate and collaborate across your devices. You decide what happens with your data, where it is and who can access it!  
Live demo: https://try.nextcloud.com/


## Perintah Umum

#### Menjalankan OCC command
Jalankan perintah dibawah ini dalam direktori Nextcloud.
```bash
/opt/rh/{PHP_VERSION}/root/bin/php occ {OCC_COMMMAND}
```

## Troubleshooting

#### Some files have not passed the integrity check
Pesan lengkap problemnya adalah, `Some files have not passed the integrity check. Further information on how to resolve this issue can be found in the documentation.`

Cara penyelesaiannya,

- Buka link `List of invalid files…` dan lihat file/folder apa saja yang ditampilkan.
- Verifikasi keberadaan file tersebut, dan hapus.

#### MySQL is used as database but does not support 4-byte characters.
Pesan lengkap problemnya adalah, `MySQL is used as database but does not support 4-byte characters. To be able to handle 4-byte characters (like emojis) without issues in filenames or comments for example it is recommended to enable the 4-byte support in MySQL. For further details read the documentation page about this.`

Cara penyelesaiannya,

1. Login ke `mysql` (jgn menggunakan `root`).
2. Ketik `show variables like 'innodb_file_format';` lalu cek kolom Value apakah = `Barracuda`. Jika benar, lanjutkan ke langkah nomor `5`.
3. Apabila Value ternyata justru = `Antelope`, edit konfigurasi file `/etc/mysql/conf.d/mysql.cnf`, tambahkan kode dibawah ini.
```ini
[mysqld]
innodb_large_prefix=true
innodb_file_format=barracuda
innodb_file_per_table=1
```
4. Login ke `mysql` dan cek lagi apakah sudah berubah.
5. Jika sudah, jalankan perintah berikut.
```sql
ALTER DATABASE {DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```
6. Keluar dari `mysql`, jalankan perintah dibawah ini secara berurutan dari dalam path tempat Nextcloud.
```bash
sudo -u {USERNAME} /opt/rh/{PVP_VERSION}/root/bin/php occ config:system:set mysql.utf8mb4 --type boolean --value="true"
sudo -u {USERNAME} /opt/rh/{PVP_VERSION}/root/bin/php occ maintenance:repair
```

#### The "X-Content-Type-Options" HTTP header is not set to "nosniff"
Pesan lengkap problemnya adalah, `The "X-Content-Type-Options" HTTP header is not set to "nosniff". This is a potential security or privacy risk, as it is recommended to adjust this setting accordingly.`.

Cara penyelesaiannya,

- Dari terminal, jalankan perintah berikut
```bash
curl -vvv https://URL_NEXTCLOUD
```
- Pastikan entri `X-Content-Type-Options: nosniff` ada disitu.
- Jika ternyata entri tersebut muncul beberapa kali, periksa file `/etc/httpd/conf/httpd.conf`. Kemungkinan entri ini pernah ada sebagai bagian setting-an dari versi yang lama. Hapus jika ada disitu.

#### The "X-Robots-Tag" HTTP header is not set to "none"
Pesan lengkap problemnya adalah, `The "X-Robots-Tag" HTTP header is not set to "none". This is a potential security or privacy risk, as it is recommended to adjust this setting accordingly.`

- Dari terminal, jalankan perintah berikut
```bash
curl -vvv https://URL_NEXTCLOUD
```
- Pastikan entri `X-Robots-Tag: none` ada disitu.
- Jika ternyata entri tersebut muncul beberapa kali, periksa file `/etc/httpd/conf/httpd.conf`. Kemungkinan entri ini pernah ada sebagai bagian setting-an dari versi yang lama. Hapus jika ada disitu.

#### SQLite is currently being used as the backend database.
Pesan lengkap problemnya adalah, `SQLite is currently being used as the backend database. For larger installations we recommend that you switch to a different database backend. This is particularly recommended when using the desktop client for file synchronisation. To migrate to another database use the command line tool: 'occ db:convert-type', or see the documentation ↗.`

Cara penyelesaiannya,

- Buat db mysql baru.
- Jalankan perintah berikut pada folder Nextcloud diinstal.
```bash
sudo -u {USERNAME} /opt/rh/{PVP_VERSION}/root/bin/php occ db:convert-type --all-apps mysql {DB_USERNAME} localhost {DB_NAME}
```
- Masukkan pass db jika diminta.

#### Some columns in the database are missing a conversion to big int.
Pesan lengkap problemnya adalah, `Some columns in the database are missing a conversion to big int. Due to the fact that changing column types on big tables could take some time they were not changed automatically. By running 'occ db:convert-filecache-bigint' those pending changes could be applied manually. This operation needs to be made while the instance is offline. For further details read the documentation page about this.`

Cara penyelesaiannya,

Jalankan perintah berikut pada folder Nextcloud diinstal.
```bash
sudo -u {USERNAME} /opt/rh/{PVP_VERSION}/root/bin/php occ db:convert-filecache-bigint
```

#### The PHP OPcache is not properly configured.
Pesan lengkap problemnya adalah, `The PHP OPcache is not properly configured. For better performance we recommend to use following settings in the php.ini:`

Cara penyelesaiannya,

- Edit file `/etc/opt/rh/{PHP_VERSION}/php.d/10-opcache.ini` sesuaikan dengan konfigurasi yang disarankan pada halaman admin Nextcloud.
- Jangan lupa aktifkan `opcache.enable_cli=1` juga.
- Simpan, dan restart dengan `systemctl restart httpd`.

#### The database is missing some indexes.
Pesan lengkap problemnya adalah, `The database is missing some indexes. Due to the fact that adding indexes on big tables could take some time they were not added automatically. By running "occ db:add-missing-indices" those missing indexes could be added manually while the instance keeps running. Once the indexes are added queries to those tables are usually much faster.`

Cara penyelesaiannya,

Jalankan perintah berikut pada folder Nextcloud diinstal.
```bash
sudo -u {USERNAME} /opt/rh/{PVP_VERSION}/root/bin/php occ db:add-missing-indices
```