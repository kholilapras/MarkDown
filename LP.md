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

## Integrasi Aplikasi dengan Firebase
1. Daftar dan login pada firebase console lalu buat sebuah projek baru.
   
   ![image](https://github.com/user-attachments/assets/7b4003d9-7945-43ad-97e9-82790befc5ca)
 
2. Tambahkan android package name, app nickname and SHA-1 signing certificate key. Android package name dapat ditemukan di ./android/app/ build.gradle. Catatan: App nickname and SHA-1 signing certificate key itu opsional.

   ![image](https://github.com/user-attachments/assets/396157de-e6c3-48a8-9d8e-9ceaa83b1998)

   ![image](https://github.com/user-attachments/assets/4d0b67bd-d524-4359-95b4-1d788c2c5aeb)

   ![image](https://github.com/user-attachments/assets/1a420833-5bf8-4d75-9de3-7489ae4ff283)

   ![image](https://github.com/user-attachments/assets/6aaaac35-0a35-407d-8dd3-69aee40df78d)

   ![image](https://github.com/user-attachments/assets/81d69537-1e50-4e6c-b801-9e688c1c595e)

   ![image](https://github.com/user-attachments/assets/389d7870-aa92-4755-b87b-959ffa81d4a5)
   
4. Setelah berhasil mendaftarkan aplikasi ke firebase, download file google-services.json lalu simpan pada ./android/app/

   ![image](https://github.com/user-attachments/assets/0d97ba30-cc5b-4a61-9438-3b5303054828)

   ![image](https://github.com/user-attachments/assets/64af2bc7-5806-43d1-b181-7981f5ce5640)



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
