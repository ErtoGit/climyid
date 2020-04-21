---
title: 'Git'
date: 2020-02-01T15:14:39+08:00
draft: false
weight: 1
summary: Manual untuk `git`.
---

# <a name="top"></a>Daftar Isi

- [Membuat repo baru](#membuat-repo-baru)
- [Menambahkan remote git url](#menambahkan-remote-git-url)
- [Mengecek alamat remote git url](#mengecek-alamat-repo-git-url)
- [Push data ke remote git](#push-data-ke-remote-git)
- [Pull data dari remote git](#pull-data-dari-remote-git)
- [Mengganti url remote repo](#menggantiurlremoterepo)
- [Clone repo](#clonerepo)

---

## Perintah umum
Untuk bantuan ketik `git help`.

#### <a name="membuat-repo-baru"></a>Membuat repo baru
Jalankan perintah berikut dalam folder project.
```bash
git init
git add .
git commit -am 'Initial commit'
```

#### <a name="menambahkan-remote-git-url"></a>Menambahkan remote git url
```bash
git remote add origin <GIT_REPO_URL>
# OR
git remote add github <GITHUB_REPO_URL>
# OR
git remote add gitlab <GITLAB_REPO_URL>
```

Bisa juga dengan cara
```bash
git remote set-url --add origin <GITHUB_REPO_URL> && git remote set-url --add origin <GITLAB_REPO_URL>
```
Dan saat mau `git push` tinggal eksekusi satu perintah ini.
```bash
git push -u origin master
```

#### <a name="mengecek-alamat-repo-git-url"></a>Mengecek alamat remote git url
```bash
git remote show origin
```

#### <a name="push-data-ke-remote-git"></a>Push data ke remote git
```bash
git push -u origin master
# OR
git push -u github master
# OR
git push -u gitlab master
```

#### <a name="pull-data-dari-remote-git"></a>Pull data dari remote git
```bash
git pull origin master
# OR
git pull origin master --allow-unrelated-histories
# OR
git pull github master
```

#### <a name="mengganti-url-remote-repo"></a>Mengganti url remote repo
```bash
git remote set-url origin <GIT_REPO_BARU>
```

#### <a name="clonerepo"></a>Clone repo
```bash
git clone <GIT_REPO_URL>
```

[[Ke atas]](#top)
