---
title: 'NPM'
date: 2020-02-01T15:14:39+08:00
draft: false
weight: 1
summary: Manual untuk `npm`.
---

## Perintah umum

### Update package

#### Global
```bash
npm update -g <package_name> 
```

#### Local project
```bash
npm update <package_name> 
```

### Cek outdated package

#### Global
```bash
npm outdated -g 
```

#### Local project
```bash
npm outdated 
```

### Build package
Jalankan perintah berikut dalam folder project 
```bash
npm run build
```


## Cara mudah update `npm` di Windows lewat PowerShell
1. Buka PowerShell dengan opsi **Run as Administrator**
2. Ketik `Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force`
3. Install package `npm-windows-upgrade` dengan command 
```powershell
npm install --global --production npm-windows-upgrade
npm-windows-upgrade
```

4. Jika ingin langsung mengupgrade, jalankan perintah ini.
```powershell
npm-windows-upgrade --npm-version latest
```

> Referensi: 
https://github.com/felixrieseberg/npm-windows-upgrade

