<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 6**  
**INTERAKSI PENGGUNA**


<img src="https://github.com/user-attachments/assets/8ffbc3d9-1f18-4a72-8723-692ba5757f0c" alt="Logo_Telkom_University" width="25%">


**Disusun Oleh**:  
Kholil Abdi Prasetiyo / 2211104071  
SISE-06-02

**Asisten Praktikum**:  
Muhammad Faza Zulian  
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

## 1. Packages
Dart package terdapat pada direktori yang didalamnya terdapat file pubspec.yaml. Contoh penggunaan packages adalah membuat request ke server menggunakan protokol http. Custom navigation/route handling menggunakan fluro, dsb.

i.) Buka web pub.dev, lalu cari packages yang di butuhkan misal google fonts, lalu klik icon copy disebelah teks nama packages  
![image](https://github.com/user-attachments/assets/ef880a21-8d27-4ccf-aeaa-a0ad9bbf34fd)  

ii.) Setelah berhasil disalin, cari dan buka file pubspec.yaml pada project flutter  
![image](https://github.com/user-attachments/assets/0bba704e-3fde-432d-94e9-934e5f885d12)  

ii. Paste teks yang telah disalin pada posisi seperti dibawah ini  
![image](https://github.com/user-attachments/assets/6fd9139a-19b7-4172-a7bf-ce8bf1bfd8f3)  





## 2. User Interaction
## 2.1 Stateful & Stateless
Widget stateless tidak pernah berubah. Ikon, IconButton, dan Teks adalah contoh widget stateless. Sub kelas widget stateless StatelessWidget. Widget stateful bersifat dinamis misalnya, ia dapat mengubah tampilannya sebagai respons terhadap peristiwa yang dipicu oleh interaksi pengguna atau saat menerima data.

## 2.2 Form
Form adalah kumpulan widget yang digunakan untuk mengumpulkan input dari pengguna. Biasanya, form ini terdiri dari beberapa field seperti TextFormField, Checkbox, Radio, dan lain-lain

## 2.3 Menu
Menu berfungsi untuk separasi antar fitur atau page. Secara umum terdapat 2 jenis widget menu yang sering digunakan, yaitu "bottom navigation bar" dan "tab bar".

## 2.4 Buttons  
- ElevatedButton : tombol yang biasa kita gunakan saat kita mendaftar, submit, login, dst. Widget ini digunakan untuk membuat tombol dengan tampilan yang lebih menonjol, biasanya dengan efek bayangan yang memberikan kesan kedalaman.  
- TextButton : widget yang digunakan untuk membuat tombol yang
menampilkan teks.
- DropdownButton : widget yang memungkinkan untuk memilih satu nilai dari serangkaian pilihan yang disediakan dalam bentuk menu dropdown. Ini sangat berguna untuk situasi di mana Anda ingin membatasi pilihan pengguna ke beberapa opsi yang sudah ditentukan

#### Source Code
```dart
import 'package:flutter/material.dart';
```

#### Output

#### Deskripsi


## 3. Flexible dan Expanded
#### Source Code
```dart
import 'package:flutter/material.dart';
```

#### Output

#### Deskripsi

# UNGUIDED

## Tugas Mandiri
Modifikasi project Rekomendasi Wisata pada Tugas Unguided 04 modul Antarmuka Pengguna dengan mengimplementasikan widget CustomScrollView, SliverAppBar, dan SliverList untuk merekomendasikan beberapa tempat wisata yang ada di Banyumas disertai foto, nama wisata, dan deskripsi singkat! (buatlah se kreatif mungkin).

#### Source Code
```dart
import 'package:flutter/material.dart';
```

#### Output


#### Deskripsi
