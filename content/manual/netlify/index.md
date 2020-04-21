---
title: 'Netlify'
date: 2020-02-01T15:14:39+08:00
draft: false
weight: 1
summary: Manual untuk `netlify`.
---

`netlify` adalah tool untuk deploy static site ke [Netlify](https://www.netlify.com/).  
Live demo: https://climyid.netlify.com/


## Perintah umum
Untuk bantuan ketik `netlify help`.

#### Deploy manual ke Netlify
Jalankan command berikut dalam folder project.
```bash
netlify sites:create --manual --with-ci
```

#### Local server
```bash
netlify dev
```