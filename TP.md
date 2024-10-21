<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 6**  
**INTERAKSI PENGGUNA**

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
<div align="center">
  
  **TUGAS PENDAHULUAN**  
  
</div>


## A. SOAL NOMOR 1
a) Pada tugas pendahuluan ini, buat project Flutter baru  
b) Implementasi Bottom Navigation Bar:  
- Tambahkan BottomNavigationBar pada halaman aplikasi.
- BottomNavigationBar memiliki 3 item menu dengan label: "Home", "Wisata",
dan "Profil".
- Setiap kali memilih salah satu menu di BottomNavigationBar, halaman yang
ditampilkan berubah sesuai menu yang dipilih.
- Home: Menampilkan teks "Ini adalah halaman Home".
- Wisata: Menampilkan teks "Ini adalah halaman Wisata".
- Profile: Menampilkan teks "Ini adalah halaman Profil".

c.) Referensi  
- Website : https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html  
- Youtube : https://www.youtube.com/watch?v=xKeyCJgK_MM  


**Contoh Output :** 

![image](https://github.com/user-attachments/assets/aa99e8c6-b1f0-49d4-903b-3ad59e6aafc1)

#### Screenshoot
- Build APK
  ![image](https://github.com/user-attachments/assets/962f1cff-38e1-414c-9771-bcabce97dda1)
- File APK yang telah selesai dilakukan build apk release
  ![image](https://github.com/user-attachments/assets/c23ef240-ade8-43f0-9cb8-2f8d5a9168a4)

#### Output
![Screenshot_2024-10-14-19-37-09-13_9be140f9878c664a160e5e59b4097c37 1](https://github.com/user-attachments/assets/f6c64a21-54fa-4a77-bd2f-b9be732b9edc)


#### Deskripsi
- Buka proyek Flutter yang telah dibuat.
- Buka terminal pada folder proyek tersebut.
- Jalankan perintah berikut untuk melakukan build file APK dalam mode rilis
  ```
  flutter build apk --release
  ```
- Tunggu sampai proses build selesai. Setelah proses selesai, file APK yang dihasilkan akan berada di direktori berikut:
  ```
  build/app/outputs/flutter-apk/app-release.apk
  ```
- Lalu buka file APK tersebut dengan emulator atau perangkat Android fisik untuk memastikan aplikasi dapat digunakan dengan baik.
