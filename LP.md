<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 7**  
**NAVIGASI DAN NOTIFIKASI**


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

## 1. Model
Data dalam sebuah aplikasi memiliki sangat banyak bentuk, tergantung dari aplikasi yang dibuat. Setiap data yang diterima atau dikirimkan akan lebih baik apabila memiliki standar yang sama. Hampir mustahil melakukan peneliharaan project yang kompleks tanpa model.

## 2. Navigation
Dalam Flutter, navigation merujuk pada cara berpindah antar halaman (atau tampilan) di aplikasi. Sistem navigasi di Flutter berbasis route dan navigator. Setiap halaman atau layar di Flutter disebut sebagai route, dan Navigator adalah widget yang mengelola stack dari route tersebut.

## 3. Notification
Untuk mengirimkan notifikasi dalam aplikasi Flutter, dapat digunakan package bernama flutter_local_notifications.

## Latihan 1
#### lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak7ppb/pages/mypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyPage(),
    );
  }
}
```

#### lib/models/product.dart
```dart
class Product {
  final int id;
  final String nama;
  final double harga;
  final String gambarUrl;
  final String deskripsi;

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambarUrl,
    required this.deskripsi,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      gambarUrl: json['gambarUrl'],
      deskripsi: json['deskripsi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'gambarUrl': gambarUrl,
      'deskripsi': deskripsi,
    };
  }
}
```

#### lib/pages/detailpage.dart
```dart
import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key, required this.data});

  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Center(child: data),
    );
  }
}
```

#### lib/pages/mypage.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak7ppb/models/product.dart';
import 'package:prak7ppb/pages/detailpage.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      nama: 'Mouse DPR',
      harga: 700000,
      gambarUrl:
          'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
      deskripsi: 'Mouse Gaming Asli Sokaraja',
    ),
    Product(
      id: 2,
      nama: 'Keyboard Mechanical',
      harga: 200000,
      gambarUrl:
          'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
      deskripsi: 'keyboard tanpa tombol yang cocok buat kamu yang males ngetik',
    ),
    Product(
      id: 3,
      nama: 'Headset Horeg',
      harga: 45000,
      gambarUrl:
          'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg',
      deskripsi: 'Rasanyaa seperti sound horeggg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Class Model'),
          centerTitle: true,
          backgroundColor: Colors.blue[400],
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final Product = products[index];
              return ListTile(
                leading: Image.network(
                  Product.gambarUrl,
                  width: 70,
                  height: 70,
                ),
                title: Text(Product.nama),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rp${Product.harga}'),
                    Text(Product.deskripsi),
                  ],
                ),
                onTap: () {
                  print('Tap layar berhasil');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Detailpage(
                        data: Icon(Icons.notifications_outlined),
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
```

#### Output





# UNGUIDED

## Tugas Mandiri
Modifikasi project TP 06 (Tugas Pendahuluan) Interaksi Pengguna, dengan mengimplementasikan penggunaan form dan button.  

#### Source Code
```dart

```

#### Output


#### Deskripsi
- BottomNavigationBar digunakan untuk beralih di antara tiga halaman: "Beranda", "Wisata", dan "Profil". Setiap ikon memiliki label dan ikon yang sesuai.  
