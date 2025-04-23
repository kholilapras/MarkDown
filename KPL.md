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
#### tp7_1_2211104071.json 
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
![image](https://github.com/user-attachments/assets/7cfbc6a2-f248-4c8d-9539-440a3d7d6061)

#### Penjelasan
Program ini merupakan dari studi kasus pembuatan dua kelas objek yaitu SayaTubeVideo dan SayaTubeUser, yang dirancang untuk merepresentasikan pengguna dan video dalam sebuah sistem sederhana seperti YouTube. Kelas SayaTubeVideo memiliki atribut seperti id, title, dan playCount, di mana id di-generate secara acak 5 digit saat objek dibuat, title menyimpan judul 
