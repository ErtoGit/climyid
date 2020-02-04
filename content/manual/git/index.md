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
```

### Mengecek alamat remote git url
```
git remote show origin
```

### Push data ke remote git
```
git push -u origin master
```

### Pull data dari remote git
```
git pull origin master
OR
git pull origin master --allow-unrelated-histories
```

### Mengganti url remote repo
```
git remote set-url origin <GIT_REPO_BARU>
```