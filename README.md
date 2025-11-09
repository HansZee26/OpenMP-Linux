# OpenMP Linux Gamemode Template

**by HansZee26 (Coding Abiezz)**

---

## 🇮🇩 Bahasa Indonesia

Template gamemode **OpenMP** ini dibuat untuk pengguna **Linux**.
Gunakan skrip `compile.sh` untuk meng-compile gamemodes, filterscripts, atau file `.inc`.

### Cara Compile :

```bash
sh compile.sh gamemodes/nama_file.pwn
```

Filterscript atau .inc file:

```bash
sh compile.sh filterscripts/nama_file.pwn
# atau
sh compile.sh include/nama_file.inc
```

Melalui VS Code:

```
Tekan Ctrl + Shift + B saat membuka file .pwn di folder gamemodes atau filterscripts.
```

Jalankan Server :

```bash
./omp-server
```

Compiler Path: pawn-compiler/pawncc
Output: Generated .amx file in the same directory

Made with care by HansZee26

---

## 🔧 Instruksi Penting: Install Paket 32-bit (i386) Terlebih Dahulu

OpenMP (serta banyak gamemode/AMX) sering bergantung pada library 32-bit pada sistem Linux modern 64-bit. Sebelum menjalankan `./omp-server` atau meng-compile/menjalankan gamemode, pastikan paket 32-bit sudah terpasang.

Berikut contoh langkah untuk distribusi Linux populer.

**Debian / Ubuntu / turunannya**

```bash
# Aktifkan arsitektur i386
sudo dpkg --add-architecture i386
sudo apt update

# Pasang library 32-bit yang umum dibutuhkan
sudo apt install -y libc6:i386 libstdc++6:i386 libgcc-s1:i386 zlib1g:i386 libncurses5:i386 lib32z1 lib32gcc-s1
```

Catatan: nama paket bisa sedikit berbeda tergantung versi distribusi. Jika ada paket yang tidak ditemukan, jalankan `apt search <nama-paket>` atau cari paket alternatif untuk rilis Anda.

**Arch Linux / Manjaro**

1. Buka `/etc/pacman.conf` dan uncomment bagian `[multilib]` serta server mirror di bawahnya.
2. Sinkronisasi dan pasang package:

```bash
sudo pacman -Syu
sudo pacman -S --needed lib32-glibc lib32-gcc-libs lib32-zlib lib32-ncurses
```

**Fedora / RHEL / CentOS (dnf/yum)**

```bash
sudo dnf install glibc.i686 libstdc++.i686 zlib.i686 ncurses-libs.i686
# atau pada CentOS menggunakan yum
sudo yum install glibc.i686 libstdc++.i686 zlib.i686 ncurses-libs.i686
```

**OpenSUSE**

```bash
sudo zypper install glibc-32bit libstdc++6-32bit zlib-32bit ncurses-32bit
```

### Verifikasi

Setelah instalasi, Anda bisa memverifikasi bahwa binary 32-bit dapat berjalan dengan menjalankan server atau memeriksa dependensi library gamemode (mis. `ldd ./omp-server` atau `file omp-server`). Jika ada library yang masih hilang, `ldd` akan menampilkan `not found` untuk nama library tersebut — pasang paket yang sesuai.

---

## 🇬🇧 English

This OpenMP gamemode template is made for Linux users.
Use the `compile.sh` script to compile your gamemodes, filterscripts, or `.inc` files.

How to Compile

Gamemode:

```bash
sh compile.sh gamemodes/your_file.pwn
```

Filterscript or .inc file:

```bash
sh compile.sh filterscripts/your_file.pwn
# or
sh compile.sh include/your_file.inc
```

Using VS Code:

```
Press Ctrl + Shift + B while editing a .pwn file in the gamemodes or filterscripts folder.
```

Run Server :

```bash
./omp-server
```

Compiler Path: pawn-compiler/pawncc
Output: Generated .amx file in the same directory

Made with care by HansZee26

---

## 🔧 Important: Install 32-bit (i386) Packages First

OpenMP and many AMX/gamemode binaries depend on 32-bit libraries on modern 64-bit Linux systems. Before running `./omp-server` or compiling/running gamemodes, make sure the required 32-bit runtime libraries are installed.

Example steps for common distributions:

**Debian / Ubuntu / derivatives**

```bash
# Enable i386 architecture
sudo dpkg --add-architecture i386
sudo apt update

# Install common 32-bit libraries
sudo apt install -y libc6:i386 libstdc++6:i386 libgcc-s1:i386 zlib1g:i386 libncurses5:i386 lib32z1 lib32gcc-s1
```

**Arch Linux / Manjaro**

1. Edit `/etc/pacman.conf` and uncomment `[multilib]` and its server lines.
2. Sync and install:

```bash
sudo pacman -Syu
sudo pacman -S --needed lib32-glibc lib32-gcc-libs lib32-zlib lib32-ncurses
```

**Fedora / RHEL / CentOS (dnf/yum)**

```bash
sudo dnf install glibc.i686 libstdc++.i686 zlib.i686 ncurses-libs.i686
# or on CentOS with yum
sudo yum install glibc.i686 libstdc++.i686 zlib.i686 ncurses-libs.i686
```

**OpenSUSE**

```bash
sudo zypper install glibc-32bit libstdc++6-32bit zlib-32bit ncurses-32bit
```

### Verification

After installation, verify the binary runs or check the library dependencies (e.g. `ldd ./omp-server` or `file omp-server`). `ldd` will list any `not found` libraries — install the corresponding 32-bit package for each missing library.

---
