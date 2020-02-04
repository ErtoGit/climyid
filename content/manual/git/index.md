---
title: 'Git'
date: 2020-02-01T15:14:39+08:00
draft: false
weight: 4
summary: Manual untuk `git`.
---

# <a name="top"></a>Daftar Isi

- [Membuat repo baru](#membuat-repo-baru)
- [Menambahkan remote git url](#menambahkan-remote-git-url)
- [Mengecek alamat remote git url](#mengecek-alamat-repo-git-url)
- [Push data ke remote git](#push-data-ke-remote-git)
- [Pull data dari remote git](#pull-data-dari-remote-git)
- [Mengganti url remote repo](#mengganti-url-remote-repo)

---

## Perintah umum
Untuk bantuan ketik `git help`.

### <a name="membuat-repo-baru"></a>Membuat repo baru
Jalankan perintah berikut dalam folder project.
```
git init
git add .
git commit -am 'Initial commit'
```

### <a name="menambahkan-remote-git-url"></a>Menambahkan remote git url
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

### <a name="mengecek-alamat-repo-git-url"></a>Mengecek alamat remote git url
```
git remote show origin
```

### <a name="push-data-ke-remote-git"></a>Push data ke remote git
```
git push -u origin master
# OR
git push -u github master
# OR
git push -u gitlab master
```

### <a name="pull-data-dari-remote-git"></a>Pull data dari remote git
```
git pull origin master
OR
git pull origin master --allow-unrelated-histories
OR
git pull github master
```

### <a name="mengganti-url-remote-repo"></a>Mengganti url remote repo
```
git remote set-url origin <GIT_REPO_BARU>
```

[[Ke atas]](#top)
