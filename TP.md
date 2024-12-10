<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 13**  
**NETWORKING**

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

## 1. Apa yang dimaksud dengan state management pada Flutter?
State management pada Flutter merujuk pada cara mengelola data (state) aplikasi dan bagaimana data tersebut berubah serta memengaruhi tampilan antarmuka pengguna (UI). State adalah informasi yang dapat berubah selama siklus hidup aplikasi, seperti data yang ditampilkan pada layar, status tombol, atau bahkan teks input pengguna.


## 2. Sebut dan jelaskan komponen-komponen yang ada di dalam GetX.
A. State Management
- Obx: Widget yang secara otomatis mendengarkan perubahan pada Rx (Reactive Variable). Saat nilai Rx berubah, Obx akan merender ulang UI yang relevan.
- GetxController: Kelas yang digunakan untuk mengelola logika dan state. Membantu memisahkan logika bisnis dari UI.
- Rx (Reactive Variable): Jenis data yang dapat didengarkan oleh UI. Setiap tipe data (seperti int, String, List, dll.) dapat dijadikan reaktif dengan menambahkan .obs.
B. Routing (Navigation)
- Get.to(): Navigasi ke halaman baru.
- Get.off(): Mengganti halaman saat ini dengan halaman baru (menghapus halaman sebelumnya dari stack).
- Get.offAll(): Menghapus semua halaman sebelumnya dan menavigasi ke halaman baru.
- Get.arguments: Digunakan untuk mengirim data antar halaman.
- Named Routes: Mendukung navigasi berbasis nama dengan GetMaterialApp.
C. Dependency Injection
- Get.put(): Menyediakan instansi yang langsung dapat digunakan di mana saja.
- Get.lazyPut(): Membuat instansi hanya ketika diperlukan (lazy initialization).
- Get.find(): Mengambil instansi yang sudah diinisialisasi dengan Get.put atau Get.lazyPut.
- Get.delete(): Menghapus instansi dari memori.
D. Snackbar, Dialog, dan BottomSheet
- Snackbar: Menampilkan pesan singkat di layar.
- Dialog: Menampilkan dialog di atas layar.
- BottomSheet: Menampilkan bottom sheet.
  
## 3. Lengkapilah code di bawah ini, dan tampilkan hasil outputnya serta jelaskan
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // TODO: Tambahkan variabel untuk menyimpan nilai counter
  // TODO: Buat fungsi untuk menambah nilai counter
  // TODO: Buat fungsi untuk mereset nilai counter
}

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Obx(() {
          // TODO: Lengkapi logika untuk menampilkan nilai counter
          return Text(
            "0", // Ganti ini dengan nilai counter
            style: TextStyle(fontSize: 48),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // TODO: Tambahkan logika untuk menambah nilai counter
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // TODO: Tambahkan logika untuk mereset nilai counter
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
```
Jawab :
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CounterController extends GetxController {
  
  var counter = 0.obs;

  void increment() {
    counter++;
  }
  
  void reset() {
    counter.value = 0;
  }
}

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Obx(() {
          
          return Text(
            "${controller.counter}", 
            style: TextStyle(fontSize: 48),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              
              controller.reset();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
```
#### Output
#### Deskripsi
