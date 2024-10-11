<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 4**  
**ANTARMUKA PENGGUNA**


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

## 1. Pengenalan Widget
Pada dasarnya semua tampilan di dalam Flutter adalah komponen yang
bernama Widget, dan akan dipecah menjadi komponen-komponen yang kecil
serta memiliki environment sendiri untuk mengelola dirinya. Masing-masing
widget memiliki state dan konfigurasinya sendiri, sehingga ketika state pada
widget berubah, widget akan membuat ulang dirinya agar selalu update dengan
perubahan yang terjadi.

Jenis-jenis Layout pada Flutter
1) Container  
Adalah widget dasar yang digunakan untuk menentukan batasan atau
constraints dari child widget-nya. Container dapat diisi dengan berbagai
jenis child widget seperti : text, image, atau bahkan layout widget lainnya.
2) Row dan Column  
Adalah layout widget yang digunakan untuk mengatur child widget secara
horizontal atau vertical.
3) Stack  
Adalah layout widget yang digunakan untuk menumpuk beberapa widget di
atau satu sama lain.
4) Expanded dan Flexible  
Adalah widget yang digunakan untuk mengatur bagaimana child widget
mengisi ruang yang tersedia. Expanded akan memberikan semua ruang
yang tersedia ke child widget, sedangkan Flexible akan memberikan
sejumlah ruang yang dapat berubahubah sesuai dengan kondisi yang ada.
5) ListView  
Adalah widget yang digunakan untuk menampilkan daftar item yang dapat
di-scroll.
6) GridView  
Adalah widget yang digunakan untuk menampilkan daftar item dalam
bentuk grid.
7) Wrap  
Adalah widget yang digunakan untuk menampilkan child widget dalam baris
atau kolom. Jika child widget melebihi lebar atau tinggi dari wrap, maka
widget tersebut akan dibungkus ke baris atau kolom berikutnya.
8) Table  
Adalah widget yang digunakan untuk menampilkan data dalam bentuk
tabel. TableRow untuk menambahkan baris, dan TableCell untuk
menambahkan kolom.


## 2. GridView
#### Source Code
```dart
import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Icon(Icons.add),
                Text('gridView ke1'),
              ],
            ),
            color: Colors.amberAccent,
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.add),
                Text('gridView ke2'),
              ],
            ),
            color: const Color.fromARGB(255, 201, 238, 15),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke3'),
            color: const Color.fromARGB(255, 228, 9, 188),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke4'),
            color: const Color.fromARGB(255, 201, 64, 255),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke5'),
            color: const Color.fromARGB(255, 255, 64, 64),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke6'),
            color: const Color.fromARGB(255, 46, 66, 164),
          ),
        ],
      ),
    );
  }
}
```

#### Output
![Screenshot 2024-10-11 123048](https://github.com/user-attachments/assets/fa2a54f2-60b1-455f-8ca1-af063d60c8da)


#### Deskripsi
- Aplikasi Flutter di atas menggunakan StatefulWidget untuk membuat sebuah tampilan berbasis grid dengan enam Container sebagai item grid.
- GridView.count dipilih karena memungkinkan pengaturan jumlah kolom dengan parameter crossAxisCount yang diset ke 2.
- Jarak antar item diatur menggunakan mainAxisSpacing dan crossAxisSpacing dengan masing-masing bernilai 5.
- Setiap Container memiliki properti padding dan color yang diatur berbeda-beda, serta berisi widget seperti Icon, Text, atau kombinasi keduanya.
- Elemen-elemen tersebut diorganisasikan dalam Row atau Column untuk mengatur tata letak konten dalam setiap item grid.


## 3. ListView
#### Source Code
```dart
import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Latihan List View !!'),
          backgroundColor: Colors.amber,
        ),
        body: ListView(
          children: [
            Container(
              height: 200,
              width: 200,
              color: const Color.fromARGB(255, 93, 34, 29),
              child: Center(
                child: Text("Type AA"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: const Color.fromARGB(255, 28, 15, 207),
              child: Center(
                child: Text("Type BB"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
              child: Center(
                child: Text("Type CC"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Center(
                child: Text("Type DD"),
              ),
            ),
          ],
        ));
  }
}
```

#### Output
![Screenshot 2024-10-11 123655](https://github.com/user-attachments/assets/20ab6c90-6991-4ab6-8208-bf3a19672c66)

#### Deskripsi
- Aplikasi Flutter menggunakan widget ListView untuk menampilkan daftar kontainer.
- Setiap kontainer memiliki ukuran tinggi dan lebar 200 piksel.
- Kontainer diisi dengan teks yang berada di tengah menggunakan widget Center.
- Terdapat empat kontainer dengan warna dan teks yang berbeda:  
  a. Kontainer pertama berwarna cokelat tua dengan teks "Type AA".  
  b. Kontainer kedua berwarna biru tua dengan teks "Type BB".  
  c. Kontainer ketiga berwarna hijau dengan teks "Type CC".  
  d. Kontainer keempat berwarna biru dengan teks "Type DD".  
- Semua kontainer ditampilkan secara vertikal dalam ListView.  


## 4. Stack
#### Source Code
```dart
import 'dart:io';
```

#### Output



#### Deskripsi


---

# UNGUIDED

## 1. Soal
#### Source Code
```dart
import 'dart:io';
```

#### Output

#### Deskripsi
