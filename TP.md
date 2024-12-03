<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 12**  
**MAPS PLACES FIREBASE NOTIFIKASI**

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

## 1. Menambahkan Google Maps Package
A. Apa nama package yang digunakan untuk mengintegrasikan Google Maps di
Flutter dan sebutkan langkah-langkah yang diperlukan untuk menambahkan
package Google Maps ke dalam proyek Flutter.
i. Buka website pub.dev lalu cari google_maps_flutter lalu klik icon copy
![image](https://github.com/user-attachments/assets/f101b682-c28c-415f-968b-3a500f53bb0e)

ii. Tambahkan package tersebut ke file pubspec.yaml di project flutter
![image](https://github.com/user-attachments/assets/b7fb5a1b-67d7-49b3-8208-b2e8b34964f2)

iii. Jalankan perintah flutter pub get di terminal

iv. Konfigurasi API Key: Dapatkan API Key dari Google Cloud Console. Aktifkan API Maps SDK for Android 

v. Buka file android/app/src/main/AndroidManifest.xml. Tambahkan API Key ke dalam elemen <application>:
```dart
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY" />
```
vi. Di file Dart, impor library
```dart
import 'package:google_maps_flutter/google_maps_flutter.dart';
```
vii. Tambahkan widget Google Maps dalam Scaffold atau widget lainnya:
```dart
GoogleMap(
  initialCameraPosition: CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 12.0,
  ),
)
```

B. Mengapa kita perlu menambahkan API Key, dan di mana API Key tersebut diatur
dalam aplikasi Flutter?
- Mengapa API Key Diperlukan?
  - Autentikasi: API Key memastikan bahwa hanya aplikasi yang memiliki izin dapat menggunakan layanan Google Maps.
  - Quota Management: Google Cloud menggunakan API Key untuk memantau penggunaan dan membatasi jumlah permintaan berdasarkan paket yang dipilih.
  - Keamanan: API Key membantu Google memastikan bahwa hanya aplikasi yang valid dapat mengakses API.  
- Di Mana API Key Diatur dalam Aplikasi Flutter?
  - Android: API Key diatur di file AndroidManifest.xml di bawah tag <application>.
  - iOS: API Key didefinisikan di file AppDelegate.swift menggunakan GMSServices.provideAPIKey("YOUR_API_KEY").

## 2. Menampilkan Google Maps
A. Tuliskan kode untuk menampilkan Google Map di Flutter menggunakan widget
GoogleMap.

B. Bagaimana cara menentukan posisi awal kamera (camera position) pada Google
Maps di Flutter?

C. Sebutkan properti utama dari widget GoogleMap dan fungsinya.


## 3. Menambahkan Marker
A. Tuliskan kode untuk menambahkan marker di posisi tertentu (latitude: -6.2088,
longitude: 106.8456) pada Google Maps.

B. Bagaimana cara menampilkan info window saat marker diklik?


## 4. Menggunakan Place Picker
A. Apa itu Place Picker, dan bagaimana cara kerjanya di Flutter dan sebutkan nama
package yang digunakan untuk implementasi Place Picker di Flutter.

B. Tuliskan kode untuk menampilkan Place Picker, lalu kembalikan lokasi yang
dipilih oleh pengguna dalam bentuk latitude dan longitude.
