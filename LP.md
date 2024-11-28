<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 11**  
**DATA STORAGE (BAGIAN 2)**


<img src="https://github.com/user-attachments/assets/8ffbc3d9-1f18-4a72-8723-692ba5757f0c" alt="Logo_Telkom_University" width="25%">


**Disusun Oleh**:  
Kholil Abdi Prasetiyo / 2211104071  
SISE-06-02

**Asisten Praktikum**:  
Muhammad Faza Zulian Gesit Al Barru  
Aisyah Hasna Aulia

**Dosen Pengampu**:  
Yudha Islami Sulistya, S.Kom., M.Cs

**PROGRAM STUDI S1 SOFTWARE ENGINEERING**  
**FAKULTAS INFORMATIKA**  
**TELKOM UNIVERSITY PURWOKERTO**  
**2024**
</div>

---
# GUIDED

## Firebase Notifikasi
Firebase Cloud Messaging (FCM) adalah layanan yang digunakan untuk mengirimkan notifikasi dengan mudah ke banyak pengguna sekaligus. Dengan FCM, Kita dapat mengirimkan pesan baik ke perangkat individu maupun ke grup pengguna yang berlangganan topik tertentu. Dokumentasi lengkapnya dapat diakses di https://firebase.google.com/docs/flutter/setup?platform=android
Agar dapat mengirim pesan, Kita perlu:
1. Mendapatkan token unik dari setiap perangkat pengguna.
2. Atau mengelompokkan pengguna berdasarkan topik tertentu (misalnya "promo" atau
"berita").
Setelah itu, notifikasi dapat dikirim menggunakan Firebase Cloud Functions.

## Jenis Pesan pada Firebase Cloud Messaging (FCM)
FCM memiliki dua jenis pesan utama yang digunakan untuk kebutuhan notifikasi, yaitu:
1) Notification Message
Pesan ini digunakan untuk langsung menampilkan notifikasi di perangkat pengguna.
Cara kerja:
- Jika aplikasi berjalan di latar depan (foreground), pesan diteruskan ke fungsi onMessage
untuk diproses.
- Jika aplikasi di latar belakang (background) atau dimatikan (terminated), notifikasi akan
langsung muncul di tray notifikasi perangkat tanpa memerlukan kode tambahan.
2) Data Message
Pesan ini memberikan lebih banyak fleksibilitas karena isinya tidak langsung ditampilkan
sebagai notifikasi.
Cara kerja:
- Pesan ini akan diproses oleh aplikasi, baik saat aplikasi aktif maupun tidak aktif.
- Untuk menampilkan notifikasi ke pengguna, Kita perlu menambahkan kode khusus,
biasanya menggunakan plugin seperti flutter_local_notifications.



## Praktikum

#### Konfigurasi


#### lib/main.dart
```dart
i
```

#### Output

#### Deskripsi

# UNGUIDED

## Tugas Mandiri
Modifikasi Guided diatas bisa menampilkan Nama, Nim, Kelas, dan Prodi kalian ke dalam Notifikasi Flutter Cloud Messaging dan landing page notifikasinya.

#### Konfigurasi

#### Source Code

lib/main.dart
```dart
import 'package:flutter/material.dart';
```

#### Output

#### Deskripsi
