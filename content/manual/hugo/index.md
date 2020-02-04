---
title: 'Hugo'
date: 2020-02-01T15:14:39+08:00
draft: false
weight: 4
summary: Manual untuk `hugo`.
---

## Perintah umum

Untuk bantuan ketik `hugo help`.

### Membuat site baru

```
hugo new site <PROJECT_NAME>
hugo build
```

### Local server

```
hugo server
```

---

## Install theme baru

Menyalin atau `git clone` sebuah theme pada folder `namaproject/themes`.

#### Install dari Git

```
cd mynewsite
cd themes
git clone <ALAMAT_GIT_REPO_THEME>
```

#### Install dari file .zip

Ekstrak semua file yang ada di file .zip yg diunduh, ke dalam folder `themes`. Struktur folder nya akan jadi seperti ini `mynewsite/themes/nama-theme-yg-diunduh`

---

## Deployment

### Persiapan
1. Pastikan `publishDir = "public"` di file `config.toml`
2. Jalankan `hugo`

Eksekusi kembali poin 2, tiap kali ada perubahan pada kode.
### Firebase
1. Pastikan `"public": "public"` di file `firebase.json` sudah sama dengan `publishDir` di file `config.toml`.
2. Login dengan `firebase login`
3. Aktifkan dengan `firebase init`
4. Edit file `firebase.json` sesuai panduan. [Cek disini](/firebase.html#deploy-multisite-dalam-project-di-hosting).
5. Akhiri dengan `firebase deploy --only hosting:<nama_app>`

Untuk re-deploy saat ada perubahan pada kode, jalankan perintah,

**PowerShell**
`hugo; firebase deploy --only hosting:<nama_app>`

**Unix terminal**
`hugo && firebase deploy --only hosting:<nama_app>`

### Netlify
1. Buat file `netlify.toml` pada root dan salin kode berikut.
```
[build]
publish = "public"
command = "hugo --gc --minify"

[context.production.environment]
HUGO_VERSION = "0.63.2"
HUGO_ENV = "production"
HUGO_ENABLEGITINFO = "true"

[context.split1]
command = "hugo --gc --minify --enableGitInfo"

[context.split1.environment]
HUGO_VERSION = "0.63.2"
HUGO_ENV = "production"

#[context.deploy-preview]
#command = "hugo --gc --minify --buildFuture -b $DEPLOY_PRIME_URL"

[context.deploy-preview.environment]
HUGO_VERSION = "0.63.2"

[context.branch-deploy]
command = "hugo --gc --minify -b $DEPLOY_PRIME_URL"

[context.branch-deploy.environment]
HUGO_VERSION = "0.63.2"

[context.next.environment]
HUGO_ENABLEGITINFO = "true"

```

2. Pastikan nilai `HUGO_VERSION` sudah sama dengan versi Hugo yang terpasang. Cek dengan perintah `hugo version` lewat terminal.
3. Kemudian pastikan juga nilai `publish = "public"` di file `netlify.toml` sudah sama dengan `publishDir` di file `config.toml`.
2. Buat site baru dengan `netlify sites:create --manual --with-ci`
3. Pada langkah `Your build command (hugo build/yarn run build/etc):` ketikkan  `hugo deploy`
4. Ikuti langkah selanjutnya.

Untuk mengupdate otomatis, cukup jalankan `git push -u origin master` tiap kali ada perubahan pada kode.