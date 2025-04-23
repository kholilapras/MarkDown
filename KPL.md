<h1>Konsruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Pendahuluan Modul 7</h3>

## JSON DESERIALIZATON 1
#### tp7_1_2211104071.json 
```js
{
    "nama": {
        "depan": "Kholil Abdi",
        "belakang": "Prasetiyo"
    },
    "nim": 2211104071,
    "fakultas": "Informatika"
}
```
#### DataMahasiswa2211104071.js
```js  
const path = require('path');
const fs = require('fs');

function ReadJSON() {
  const filePath = path.join(__dirname, 'tp7_1_2211104071.json');

  fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
      console.error('Gagal membaca file:', err);
      return;
    }

    try {
      const obj = JSON.parse(data);
      const namaLengkap = obj.nama.depan + ' ' + obj.nama.belakang;
      const nim = obj.nim;
      const fakultas = obj.fakultas;

      console.log(`Nama ${namaLengkap} dengan nim ${nim} dari fakultas ${fakultas}`);
    } catch (parseErr) {
      console.error('Gagal parsing JSON:', parseErr);
    }
  });
}

ReadJSON();
```

#### Output
![image](https://github.com/user-attachments/assets/8be4e4d7-0f8b-4dbd-af89-5bfaea1528ee)

#### Penjelasan
Program DataMahasiswa2211104071.js merupakan contoh deserialisasi JSON dalam Node.js, yaitu proses mengubah data dalam format JSON menjadi objek JavaScript. Program ini membaca file tp7_1_2211104071.json yang berada dalam direktori yang sama menggunakan modul fs (File System). File tersebut berisi data mahasiswa seperti nama, NIM, dan fakultas. Setelah file berhasil dibaca, isinya diubah menjadi objek JavaScript menggunakan JSON.parse(). Program kemudian menggabungkan nama depan dan belakang menjadi namaLengkap, mengambil nilai nim dan fakultas, lalu mencetak informasi lengkap mahasiswa ke konsol dalam format: "Nama [nama lengkap] dengan nim [NIM] dari fakultas [fakultas]". Jika terjadi kesalahan saat membaca file atau parsing JSON, program akan menampilkan pesan error ke konsol.

<br>

## JSON DESERIALIZATON 2
#### tp7_2_2211104071.json 
```js
{
    "courses": [
        {
            "code": "CCK2DAB3",
            "name": "Proses Perangkat Lunak"
        },
        {
            "code": "CCK2LAB3",
            "name": "Kecerdasan Buatan"
        },
        {
            "code": "CCK2JAC2",
            "name": "Proyek Tingkat II"
        },
        {
            "code": "CCK3IAB2",
            "name": "Tata Tulis Ilmiah"
        },
        {
            "code": "CCK1LAB3",
            "name": "Design Thinking"
        },
        {
            "code": "CCK2KAB4",
            "name": "Konstruksi Perangkat Lunak"
        },
        {
            "code": "CCK3KAB3",
            "name": "Manajemen Konfigurasi dan Evolusi Perangkat Lunak"
        }
    ]
}
```

#### KuliahMahasiswa2211104071.js 
```js
const fs = require('fs');
const path = require('path');

function ReadJSON() {
  const filePath = path.join(__dirname, 'tp7_2_2211104071.json');

  fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
      console.error('Gagal membaca file:', err);
      return;
    }

    try {
      const obj = JSON.parse(data);

      console.log("Daftar mata kuliah yang diambil:");

      obj.courses.forEach((course, index) => {
        console.log(`MK ${index + 1} ${course.code} - ${course.name}`);
      });
    } catch (parseErr) {
      console.error('Gagal parsing JSON:', parseErr);
    }
  });
}

ReadJSON();
```

#### Output
![image](https://github.com/user-attachments/assets/52eddeef-fd9d-42ca-a802-bb963a429bc9)

#### Penjelasan
Program KuliahMahasiswa2211104071.js adalah contoh deserialisasi data JSON yang berisi daftar mata kuliah menggunakan Node.js. Program ini menggunakan modul fs untuk membaca file tp7_2_2211104071.json, yang berada dalam direktori yang sama. File tersebut berisi array objek courses, di mana setiap objek merepresentasikan mata kuliah dengan atribut code (kode mata kuliah) dan name (nama mata kuliah). Setelah file berhasil dibaca, isinya dikonversi menjadi objek JavaScript menggunakan JSON.parse(). Program kemudian mencetak judul "Daftar mata kuliah yang diambil:", lalu melakukan iterasi terhadap array courses menggunakan forEach. Dalam setiap iterasi, program mencetak nama dan kode mata kuliah dengan format: "MK [nomor] [kode] - [nama]". Jika terjadi kesalahan saat membaca file atau parsing JSON, program akan menampilkan pesan kesalahan.
