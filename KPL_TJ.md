<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Pertemuan 13</h3>

<br>

# MENJELASKAN DESIGN PATTERN SINGLETON
Buka halaman web https://refactoring.guru/de sign-patterns/catalog kemudian baca design pattern dengan nama “Singleton”, dan jawab pertanyaan berikut ini (dalam Bahasa Indonesia):

## A.) Berikan salah dua contoh kondisi dimana design pattern “Singleton” dapat digunakan.
  - Manajemen Koneksi Basis Data: Dalam aplikasi yang memerlukan akses ke basis data, seringkali efisien untuk memiliki satu objek yang mengelola koneksi ke basis data tersebut. Dengan menggunakan pola Singleton, kita memastikan bahwa hanya ada satu instance dari objek koneksi yang digunakan secara global, sehingga menghemat sumber daya dan memastikan konsistensi data.
  - Pengelolaan Konfigurasi Aplikasi: Aplikasi biasanya memiliki pengaturan atau konfigurasi yang perlu diakses di berbagai bagian program. Dengan menerapkan pola Singleton untuk kelas konfigurasi, kita menjamin bahwa semua komponen aplikasi mengakses dan memodifikasi satu set konfigurasi yang sama, sehingga menghindari inkonsistensi.

## B.) Berikan penjelasan singkat mengenai langkah-langkah dalam mengimplementasikan design pattern “Singleton”.
- Membuat Konstruktor Privat: Konstruktor kelas dibuat privat untuk mencegah instansiasi langsung dari luar kelas.
- Mendeklarasikan Variabel Statis Privat: Membuat variabel statis privat dalam kelas untuk menyimpan satu-satunya instance dari kelas tersebut.  
- Menyediakan Metode Statis Publik: Membuat metode statis publik yang mengembalikan instance dari kelas. Metode ini memeriksa apakah instance sudah dibuat; jika belum, ia akan membuat instance baru dan menyimpannya dalam variabel statis.  
- Memastikan Thread-Safety (Opsional): Dalam lingkungan multithreading, pastikan bahwa pembuatan instance aman dari kondisi race dengan menggunakan sinkronisasi atau mekanisme lainnya.  

## C.) Berikan tiga kelebihan dan kekurangan dari design pattern “Singleton”.
Kelebihan:
- Kontrol Instansi Tunggal: Memastikan bahwa hanya ada satu instance dari kelas yang dibuat, yang berguna untuk mengelola sumber daya bersama seperti koneksi basis data atau pengaturan konfigurasi.
- Akses Global: Menyediakan titik akses global ke instance tunggal, memudahkan komponen lain dalam aplikasi untuk mengaksesnya tanpa perlu membuat instance baru.
- Inisialisasi Tertunda: Instance hanya dibuat saat pertama kali dibutuhkan, yang dapat meningkatkan efisiensi penggunaan sumber daya.

Kekurangan:
- Pelanggaran Single Responsibility Principle: Pola Singleton menggabungkan tanggung jawab untuk memastikan satu instance dengan tanggung jawab bisnis lainnya, yang dapat melanggar prinsip tanggung jawab tunggal.
- Kesulitan dalam Pengujian Unit: Karena pola Singleton menyediakan akses global dan mengontrol instansiasi, hal ini dapat menyulitkan pembuatan mock atau stub dalam pengujian unit, sehingga mengurangi fleksibilitas pengujian.
- Masalah dalam Lingkungan Multithreading: Tanpa penanganan yang tepat, implementasi Singleton dapat menyebabkan masalah dalam lingkungan multithreading, seperti pembuatan beberapa instance secara tidak sengaja.

<br>

# IMPLEMENTASI DAN PEMAHAMAN DESIGN PATTERN SINGLETON
PusatDataSingleton.js
```js
class PusatDataSingleton {
  constructor() {
    if (PusatDataSingleton._instance) {
      throw new Error("Gunakan PusatDataSingleton.getDataSingleton()");
    }
    this.DataTersimpan = [];
    PusatDataSingleton._instance = this;
  }

  static getDataSingleton() {
    if (!PusatDataSingleton._instance) {
      new PusatDataSingleton();
    }
    return PusatDataSingleton._instance;
  }

  getSemuaData() {
    return this.DataTersimpan;
  }

  printSemuaData() {
    this.DataTersimpan.forEach((item, index) => {
      console.log(`${index + 1}. ${item}`);
    });
  }

  addSebuahData(input) {
    this.DataTersimpan.push(input);
  }

  hapusSebuahData(index) {
    if (index >= 0 && index < this.DataTersimpan.length) {
      this.DataTersimpan.splice(index, 1);
    } else {
      console.log("Index tidak valid");
    }
  }
}

// Export class agar bisa digunakan di file lain
module.exports = PusatDataSingleton;
```

<br>

# IMPLEMENTASI PROGRAM UTAMA
main.js
```js
// Import class Singleton dari file lain
const PusatDataSingleton = require('./PusatDataSingleton');

// === Bagian A & B ===
// Buat dua variabel dengan tipe PusatDataSingleton
const data1 = PusatDataSingleton.getDataSingleton();
const data2 = PusatDataSingleton.getDataSingleton();

// === Bagian C ===
// Tambahkan data anggota kelompok dan asisten praktikum ke data1
data1.addSebuahData("Anggota 1 - Thom Haye");
data1.addSebuahData("Anggota 2 - Jat Idzes");
data1.addSebuahData("Asisten - Denny Landzaat");

// === Bagian D ===
// Print isi data2, seharusnya menampilkan semua data yang ditambahkan lewat data1
console.log("\n--- Isi data2 ---");
data2.printSemuaData();

// === Bagian E ===
// Hapus data asisten (indeks ke-2 = elemen ketiga)
data2.hapusSebuahData(2);

// === Bagian F ===
// Cek kembali isi data1, asisten seharusnya sudah tidak muncul
console.log("\n--- Isi data1 setelah hapus asisten ---");
data1.printSemuaData();

// === Bagian G ===
// Tampilkan jumlah data yang tersisa di kedua variabel (harus sama, karena Singleton)
console.log(`\nJumlah data di data1: ${data1.getSemuaData().length}`);
console.log(`Jumlah data di data2: ${data2.getSemuaData().length}`);
```

#### Output
![image](https://github.com/user-attachments/assets/4624cb04-cad1-4eac-abdd-524b9a591cec)

#### Penjelasan
Program ini merupakan implementasi dari design pattern Singleton menggunakan JavaScript. Tujuan utamanya adalah memastikan hanya ada satu objek dari class PusatDataSingleton yang digunakan bersama di seluruh program. Class ini memiliki atribut DataTersimpan berupa list/array yang menyimpan data dalam bentuk string. Instance dari class hanya dapat dibuat satu kali melalui method statis getDataSingleton(). Metode-metode lainnya seperti addSebuahData(), hapusSebuahData(), printSemuaData(), dan getSemuaData() digunakan untuk menambah, menghapus, mencetak, dan mengambil seluruh data dalam list.

Dalam program utama (main.js), dibuat dua variabel data1 dan data2 yang keduanya mendapatkan instance yang sama melalui getDataSingleton(). Data nama anggota kelompok dan asisten praktikum ditambahkan melalui data1. Saat data2 digunakan untuk mencetak data, data tersebut muncul karena keduanya berbagi instance yang sama. Kemudian, nama asisten dihapus melalui data2, dan saat data1 mencetak ulang isi list, nama tersebut sudah tidak ada. Ini membuktikan bahwa instance dari class tersebut memang satu dan bersifat global. Terakhir, program menampilkan jumlah data yang tersisa pada data1 dan data2, yang hasilnya tentu sama karena datanya tersimpan dalam satu objek singleton. Program ini menggambarkan bagaimana pola Singleton dapat digunakan untuk mengelola sumber data global yang konsisten di berbagai bagian aplikasi.
