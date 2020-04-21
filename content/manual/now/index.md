---
title: 'Now'
date: 2020-02-01T15:14:39+08:00
draft: false
weight: 1
summary: Manual untuk `now`.
---

`now` adalah tool untuk deploy static site ke [ZEIT](https://zeit.co).  
Live demo: https://manual.now.sh

## Instalasi
```bash
npm install -g now
```

## Perintah umum
Untuk bantuan ketik `now help`.

#### Deploy ke ZEIT
Jalankan command berikut dalam folder project.
```bash
now
```

#### Update project
Jalankan command berikut dalam folder project.
```bash
now --prod
```

#### Local server
```bash
now dev
```