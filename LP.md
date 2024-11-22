<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 10**  
**DATA STORAGE (BAGIAN 1)**


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

## 1. Pengenalan SQLite
SQLite adalah database relasional yang merupakan penyimpanan data secara offline untuk sebuah mobile app (pada local storage, lebih tepatnya pada cache memory aplikasi). SQLite memiliki CRUD (create, read, update dan delete).


## 2. SQL Helper Dasar
Dalam Flutter, SQL Helper biasanya merujuk pada penggunaan paket seperti sqflite untuk mengelola database SQLite. SQL Helper merupakan class untuk membuat beberapa method yang berkaitan dengan perubahan data. sqflite adalah plugin Flutter yang memungkinkan untuk melakukan operasi CRUD (Create, Read, Update, Delete) pada database SQLite.


## Praktikum

#### Konfigurasi
Izinkan akses kamera pada AndroidManifest.xml
![image](https://github.com/user-attachments/assets/03eddcf2-2e6e-4f4f-95e2-1fe0be3e588f)  

Ubah minimum versi Android sdk ke 21  
![image](https://github.com/user-attachments/assets/f97765a5-a10e-4f03-932b-c33aaeb67d6c)

Tambahkan Package Camera  
![image](https://github.com/user-attachments/assets/402f0a03-45bb-463f-94c1-01a35fb0542c)

#### lib/main.dart
```dart
import 'package:flutter/material.dart';
```

#### lib/camera_screen.dart
```dart
import 'package:camera/camera.dart';
```

#### lib/display_screen.dart
```dart
import 'dart:io';
```

#### Output

#### Deskripsi

# UNGUIDED

## Tugas Mandiri
1. Modifikasi project pemilihan gambar yang telah dikerjakan pada TugasPendahuluan Modul 09 agar fungsionalitas tombol dapat berfungsi untuk mengunggah gambar.
- Ketika tombol Gallery ditekan, aplikasi akan mengambil gambar dari galeri, dan setelah gambar dipilih, gambar tersebut akan ditampilkan di dalam container.
- Ketika tombol Camera ditekan, aplikasi akan mengambil gambar menggunakan kamera, dan setelah pengambilan gambar selesai, gambar tersebut akan ditampilkan di dalam container.
- Ketika tombol Hapus Gambar ditekan, gambar yang ada pada container akan dihapus.

#### Konfigurasi
Izinkan akses kamera pada AndroidManifest.xml
![image](https://github.com/user-attachments/assets/03eddcf2-2e6e-4f4f-95e2-1fe0be3e588f)  

Ubah minimum versi Android sdk ke 21  
![image](https://github.com/user-attachments/assets/f97765a5-a10e-4f03-932b-c33aaeb67d6c)

Tambahkan Package Camera dan Image Picker  
![image](https://github.com/user-attachments/assets/6d0f65ea-6a21-4cbe-9d40-4a473197dd22)

#### Source Code
lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP 9_2211104071',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ImageSelectionScreen(),
    );
  }
}

class ImageSelectionScreen extends StatefulWidget {
  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Memilih Gambar'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: _imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.image_outlined,
                        size: 250,
                        color: Colors.grey,
                      ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImageFromCamera,
                    icon: Icon(Icons.camera_alt_outlined),
                    label: Text("Camera"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _pickImageFromGallery,
                    icon: Icon(Icons.image_outlined),
                    label: Text("Gallery"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _clearImage,
                child: Text("Hapus Gambar"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber,
                  minimumSize: Size(200, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

#### Output
- Camera  
  ![Screenshot_2024-11-17-10-56-01-83_fa1458e74bdcc1bba02e487794c37064](https://github.com/user-attachments/assets/db95e090-38a0-4a56-9eb5-761aac28a29f)

- Gallery  
  ![Screenshot_2024-11-17-10-56-47-47_fa1458e74bdcc1bba02e487794c37064](https://github.com/user-attachments/assets/bc23169b-aede-476a-81eb-3195d6475a7c)

- Hapus  
  ![Screenshot_2024-11-17-10-56-53-22_fa1458e74bdcc1bba02e487794c37064](https://github.com/user-attachments/assets/df00309a-5e10-47f3-9a61-a12601100ae4)

#### Deskripsi
- Class ImageSelectionScreen: StatefulWidget yang memungkinkan aplikasi merender ulang UI berdasarkan perubahan gambar.
- State _ImageSelectionScreenState
  Variabel _imageFile: Menyimpan file gambar yang dipilih.
  ImagePicker _picker: Instance untuk mengakses galeri/kamera.
- Fungsi _pickImageFromGallery:
  Membuka galeri untuk memilih gambar.
  Gambar yang dipilih disimpan dalam variabel _imageFile dan ditampilkan di container.
- Fungsi _pickImageFromCamera:
  Membuka kamera untuk mengambil gambar.
  Gambar yang diambil disimpan dalam _imageFile dan ditampilkan.
- Fungsi _clearImage:
  Mengatur _imageFile ke null untuk menghapus gambar dari UI.
