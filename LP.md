<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 12**  
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
# GUIDED

## Google Maps API
Google Maps API merupakan salah satu layanan dari Google untuk membantu developer menciptakan aplikasi yang menggunakan fitur peta atau maps. Pada Google Maps API kita dapat memasang marker, menggunakan fitur route, mencari tempat, dan masih banyak lagi. Cara implementasi Google API pada flutter dapat dilakukan dengan menggunakan packages Google Maps. Tahapan dalam menambahkan Google Maps API dapat mengikuti langkah-langkah berikut :
1. Dapatkan API key melalui link berikut https://cloud.google.com/maps-platform/
2. Selanjutnya, enable Google Map SDK di tiap platform yang akan menggunakan Google
Maps.  
a. Pergi ke https://console.cloud.google.com/ (Google Delevopers Console)  
b. Pilih project yang ingin menggunakan Google Maps  
c. Pilih pada navigation menu, lalu pilih “Google Maps”  
d. Pilih “APIs” di bawah menu Google Maps  
e. Untuk mengaktifkan Google Maps di Android, pilih “Maps SDK for Android” pada  
section “Additional APIs”, lalu pilih “ENABLE”  
f. Untuk mengaktifkan Google Maps di iOS, pilih “Maps SDK for iOS” pada section  
“Additional APIs”, lalu pilih “ENABLE”  
g. Pastikan bahwa APIs telah aktif pada section “Enabled APIs”  
h. Untuk lebih detail bisa cek di https://developers.google.com/maps/gmp-get-started  

## Praktikum

#### Cara Mendapatkan API Google Maps secara cepat
salin dan buka link url berikut ini:
```
https://console.developers.google.com/flows/enableapi?apiid=maps-android-backend.googleapis.com&keyType=CLIENT_SIDE_ANDROID
```

#### Set minSdkVersion
![image](https://github.com/user-attachments/assets/f76f48ae-0bd7-4f50-bcf7-c2b0c0ec93a5)

#### Tambahkan API key pada manifest aplikasi
![image](https://github.com/user-attachments/assets/e262a565-1caf-4a86-b959-3e01ec146e5a)

#### Menambah Packages Google Maps
![image](https://github.com/user-attachments/assets/1791077c-30da-4b9a-b287-4cfaa919aa07)

#### Source Code
- homepage.dart
```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final LatLng _kMapCenter = LatLng(-7.4352631, 109.2465177);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 12.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
      ),
    );
  }
}
```
  
- main.dart
```dart
import 'package:flutter/material.dart';
import 'package:guided12_ppb/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

#### Output

#### Penjelasan




#### lib/main.dart
```dart
}
```

#### Output

#### Deskripsi

# UNGUIDED

## Tugas Mandiri
Modifikasi Guided diatas bisa menampilkan Nama, Nim, Kelas, dan Prodi kalian ke dalam Notifikasi Flutter Cloud Messaging dan landing page notifikasinya.

#### Konfigurasi Membuat Notifikasi Via FCM Console

#### Source Code

lib/main.dart
```dart
}
```

#### Output

#### Deskripsi
