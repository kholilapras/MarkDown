<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Pertemuan 14</h3>

<br>

# REFACTORING DENGAN STANDAR CODE
Copy salah satu folder tugas jurnal yang dimiliki sebelumnya (dari modul 2 sampai modul 13), kemudian rename folder hasil copy-paste tersebut dengan modul14_NIM (coba pilih tugas pendahuluan yang paling sederhana).  
Dengan mengikuti standard code yang digunakan (misal C# dengan standar dari .NET), pastikan kode yang dikumpulkan memenuhi faktor-faktor berikut:  
A. Naming convention  
i. Variable / Property / Attribute  
ii. Method / Function / Procedure  
B. White space dan indentation  
C. Variable / attribute declarations  
D. Comments  

#### SourceCode
main.js
```js
// Import class Singleton
const PusatDataSingleton = require('./PusatDataSingleton');

// Dapatkan instance Singleton
const data1 = PusatDataSingleton.getInstance();
const data2 = PusatDataSingleton.getInstance();

// Tambahkan data anggota dan asisten ke data1
data1.addData("Anggota 1 - Thom Haye");
data1.addData("Anggota 2 - Jat Idzes");
data1.addData("Asisten - Denny Landzaat");

// Tampilkan semua data melalui data2
console.log("\n--- Isi data2 ---");
data2.printAllData();

// Hapus data asisten dari data2 (indeks ke-2)
data2.deleteData(2);

// Cek isi data1 setelah penghapusan
console.log("\n--- Isi data1 setelah hapus asisten ---");
data1.printAllData();

// Tampilkan jumlah data yang tersisa (seharusnya sama)
console.log(`\nJumlah data di data1: ${data1.getAllData().length}`);
console.log(`Jumlah data di data2: ${data2.getAllData().length}`);
```

PusatDataSingleton.js
```js
class PusatDataSingleton {
    constructor() {
        if (PusatDataSingleton._instance) {
            throw new Error("Gunakan PusatDataSingleton.getInstance()");
        }

        // Inisialisasi array untuk menyimpan data
        this.storedData = [];

        PusatDataSingleton._instance = this;
    }

    // Static method untuk mendapatkan instance Singleton
    static getInstance() {
        if (!PusatDataSingleton._instance) {
            new PusatDataSingleton();
        }
        return PusatDataSingleton._instance;
    }

    // Mengembalikan semua data yang tersimpan
    getAllData() {
        return this.storedData;
    }

    // Menampilkan semua data ke konsol
    printAllData() {
        this.storedData.forEach((item, index) => {
            console.log(`${index + 1}. ${item}`);
        });
    }

    // Menambahkan satu data ke array
    addData(input) {
        this.storedData.push(input);
    }

    // Menghapus data berdasarkan indeks
    deleteData(index) {
        if (index >= 0 && index < this.storedData.length) {
            this.storedData.splice(index, 1);
        } else {
            console.log("Index tidak valid");
        }
    }
}

// Ekspor class agar bisa digunakan di file lain
module.exports = PusatDataSingleton;
```
#### Output
![image](https://github.com/user-attachments/assets/2e62770d-b414-47c3-87ea-48d9787d3ed4)

#### Penjelasan
Beberapa aspek telah diubah untuk meningkatkan kualitas kode. Nama properti "DataTersimpan" kini menjadi "storedData" mengikuti konvensi camelCase. Nama method "addSebuahData()" disederhanakan menjadi "addData()". Indentasi yang sebelumnya kurang konsisten, kini sudah rapi dengan 2 spasi. Komentar juga telah ditambahkan untuk memberikan penjelasan yang lebih baik.
