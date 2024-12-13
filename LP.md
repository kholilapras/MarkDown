<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 13**  
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
# GUIDED

## Networking / State Management
State management dalam Flutter adalah proses mengelola state atau status dari aplikasi, yaitu data atau informasi yang dapat berubah sepanjang siklus hidup aplikasi. State ini mencakup segala hal yang memengaruhi tampilan antarmuka pengguna (UI), seperti input pengguna, data dari API, dan status internal widget. Ketika aplikasi semakin kompleks dibuat, maka pasti akan ada saatnya dimana harus dibagikan state aplikasi ke berbagai halaman yang ada.

Flutter adalah deklaratif, sehingga Flutter membangun user interface berdasarkan state saat ini. Dengan menggunakan state management, dapat dilakukan sentralisasi semua state dari berbagai macam UI Control untuk mengendalikan aliran data lintas aplikasi.

State management penting karena aplikasi Flutter sering kali terdiri dari banyak widget yang saling terkait. Dengan mengelola state dengan baik, kita dapat memastikan :
• Sinkronisasi UI dan data, karena selalu mencerminkan data terkini.
• Organisasi kode yang baik untuk mempermudah pengembangan dan pemeliharaan.
• Pengurangan bug, karena state yang dikelola dengan benar mengurangi kemungkinan
terjadinya bug.

## App State (State Global)
State ini digunakan di berbagai widget dalam aplikasi. Contohnya adalah informasi pengguna yang masuk, data keranjang belanja, atau tema aplikasi. App state biasanya membutuhkan pendekatan state management yang lebih kompleks. Package/library pendukung Flutter memiliki berbagai framework atau package untuk state management, seperti :

A. Provider
Provider adalah library state management yang didukung resmi oleh tim Flutter. Provider memanfaatkan kemampuan bawaan Flutter seperti InheritedWidget, tetapi dengan cara yang lebih sederhana dan efisien.

B. BloC/Cubit
Bloc (Business Logic Component) adalah pendekatan state management berbasis pola stream. Bloc memisahkan business logic dari UI, sehingga cocok untuk aplikasi yang besar dan kompleks.

C. Riverpod
Riverpod adalah framework state management modern yang dirancang sebagai pengganti atau alternatif untuk Provider. Riverpod lebih fleksibel dan mengatasi beberapa keterbatasan Provider.

D. GetX
GetX adalah framework Flutter serbaguna yang menyediakan solusi lengkap untuk state management, routing, dan dependency injection. GetX dirancang untuk meminimalkan boilerplate code, meningkatkan efisiensi, dan mempermudah pengembangan aplikasi Flutter, terutama yang memerlukan reaktivitas tinggi.

## Praktikum

#### Menambahkan Package GetX
![image](https://github.com/user-attachments/assets/fcb45c55-7c7f-41e9-b1e6-609541d8b478)

#### Stuktur Folder
![image](https://github.com/user-attachments/assets/43fe9682-3b82-412b-9d42-3b460132e3a1)


#### Source Code
- lib/view/detail_page.dart
```dart
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail'),
      ),
      body: const Center(
        child: Text('Halaman Detail'),
      ),
    );
  }
}
```

- lib/view/my_home_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak13ppb/view model/counter_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              controller.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/detail');
                },
                child: Text('Go to Detail Page'))
          ],
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: controller.getsnackbar,
            tooltip: 'Snackbar',
            child: const Icon(Icons.chat),
          ),
          FloatingActionButton(
            onPressed: controller.getdialog,
            tooltip: 'Dialog',
            child: const Icon(Icons.notifications),
          ),
          FloatingActionButton(
            onPressed: controller.getbottomsheet,
            tooltip: 'Bottom Sheet',
            child: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}
```

- lib/view model/counter_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void getsnackbar(){
    Get.snackbar(
      'GetX Snackbar',
      'Ini Snackbar', 
      colorText: Colors.white, 
      backgroundColor: Colors.green,
      );
  }

  void getdialog() {
    Get.defaultDialog(
      title: 'GetX Dialog',
      middleText: 'Ini dialog'
      );
  }

  void getbottomsheet(){
    Get.bottomSheet(Container(
      height: 70,
      width: double.infinity,
      color: Colors.amber,
      child: Text('Ini adalah Bottom Sheet'),
    )
    );
  }
}
```

- lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak13ppb/view/detail_page.dart';
import 'package:prak13ppb/view/my_home_page.dart';
import 'package:prak13ppb/view model/counter_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name:'/', 
          page: ()=> MyHomePage(title: 'Belajar GetX'),
        ),
        GetPage(
          name:'/detail', 
          page: ()=> DetailPage(),
        ),
      ],
    );
  }
}
```

#### Output


#### Deskripsi
- main.dart
  - Dependency Injection dilakukan dengan Get.put untuk menyediakan instance CounterController.
  - GetMaterialApp digunakan sebagai wrapper utama untuk routing dan navigasi.
  - initialRoute: Menentukan halaman awal.
  - getPages: Mendaftarkan rute ke halaman:
- counter_controller.dart
  - counter: Variabel observable untuk menghitung nilai counter.
  - incrementCounter: Menambah nilai counter.
  - decrementCounter: Mengurangi nilai counter.
  - getsnackbar: Menampilkan Snackbar dengan pesan.
  - getdialog: Menampilkan Dialog dengan judul dan isi.
  - getbottomsheet: Menampilkan Bottom Sheet dengan kontainer kuning.
- my_home_page.dart
  - Tombol Increment: Menambah nilai counter.
  - Tombol Decrement: Mengurangi nilai counter.
  - Tombol Snackbar: Menampilkan snackbar.
  - Tombol Dialog: Menampilkan dialog.
  - Tombol Bottom Sheet: Menampilkan bottom sheet.
  - Tombol Go to Detail Page: Navigasi ke halaman detail
- detail_page.dart
  - Halaman sederhana dengan teks "Halaman Detail".

# UNGUIDED

## Tugas Mandiri
Buatlah Aplikasi Catatan Sederhana menggunakan GetX, dengan ketentuan sebagai berikut :
1. Halaman utama atau Homepage untuk menampilkan daftar catatan yang telah ditambahkan. Setiap catatan terdiri dari judul dan deskripsi singkat, serta terdapat tombol untuk menghapus catatan dari daftar.
2. Halaman kedua untuk menambah catatan baru, berisi : form untuk memasukkan judul dan deskripsi catatan, serta tombol untuk menyimpan catatan ke daftar (Homepage).
3. Menggunakan getx controller.
4. Menggunakan getx routing untuk navigasi halaman.

#### Konfigurasi

#### Source Code
lib/main.dart
```dart
}
```

#### Output

#### Deskripsi
