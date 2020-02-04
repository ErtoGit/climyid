---
title: 'Git'
date: 2020-02-01T15:14:39+08:00
draft: false
weight: 4
summary: Manual untuk `git`.
---

## Perintah umum
Untuk bantuan ketik `git help`.

### Membuat repo baru
Jalankan perintah berikut dalam folder project.
```
git init
git add .
git commit -am 'Initial commit'
```

### Menambahkan remote git url
```
git remote add origin <GIT_REPO_URL>
# OR
git remote add github <GITHUB_REPO_URL>
# OR
git remote add gitlab <GITLAB_REPO_URL>
```

Bisa juga dengan cara
```
git remote set-url --add origin <GITHUB_REPO_URL> && git remote set-url --add origin <GITLAB_REPO_URL>
```
Sehingga saat mau `git push` tinggal eksekusi satu perintah ini.
```
git push -u origin master
```

### Mengecek alamat remote git url
```
git remote show origin
```

### Push data ke remote git
```
git push -u origin master
# OR
git push -u github master
# OR
git push -u gitlab master
```

### Pull data dari remote git
```
git pull origin master
OR
git pull origin master --allow-unrelated-histories
OR
git pull github master
```

### Mengganti url remote repo
```
git remote set-url origin <GIT_REPO_BARU>
```