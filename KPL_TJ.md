<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Pertemuan 12</h3>

<br>

## MEMBUAT PROJECT GUI BARU
#### 1.) Buat Folder Project Baru lalu buka terminal
![image](https://github.com/user-attachments/assets/feecb9c3-399c-437e-aa5e-5812b996ff62)

#### 2.) Inisialisasi Project
```
npm init -y
```
```
npm install electron jest --save-dev
```
![image](https://github.com/user-attachments/assets/ffd44d37-6538-4eb4-9de9-895dcc024a71)

#### 2.) Konfigurasi package.json
![image](https://github.com/user-attachments/assets/206eca74-08e4-4b63-ac81-370c39398a90)

<br>

## MEMBUAT GUI SEDERHANA
#### 1.) Tambahkan file logic.js
```js
function CariNilaiPangkat(a, b) {
  if (b === 0) return 1;
  if (b < 0) return -1;
  if (b > 10 || a > 100) return -2;

  let result = 1;
  for (let i = 0; i < b; i++) {
    result *= a;
    if (result > Number.MAX_SAFE_INTEGER) return -3;
  }

  return result;
}

module.exports = { CariNilaiPangkat };
```

#### 2.) Tambahkan file index.html
```html
<!DOCTYPE html>
<html>
<head>
  <title>Modul 12</title>
</head>
<body>
  <h1>Cari Nilai Pangkat</h1>
  <input id="a" type="number" placeholder="Nilai a" />
  <input id="b" type="number" placeholder="Nilai b" />
  <button onclick="hitung()">Hitung</button>
  <p id="hasil">Hasil akan tampil di sini</p>
  <script src="renderer.js"></script>
</body>
</html>
```

#### 3.) Tambahkan file renderer.js
```js
const { CariNilaiPangkat } = require('./logic');

window.hitung = () => {
  const a = parseInt(document.getElementById('a').value);
  const b = parseInt(document.getElementById('b').value);
  const hasil = CariNilaiPangkat(a, b);
  document.getElementById('hasil').textContent = `Hasil: ${hasil}`;
};
```

#### 4.) Tambahkan file main.js
```js
const { app, BrowserWindow } = require('electron');
const path = require('path');

function createWindow () {
  const win = new BrowserWindow({
    width: 400,
    height: 300,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false,
    }
  });

  win.loadFile('index.html');
}

app.whenReady().then(createWindow);
```

<br>

## MELAKUKAN SOFTWARE PROFILING
#### 1.) Running Project
```
npm start
```
![image](https://github.com/user-attachments/assets/4cee5463-b323-4364-8a77-0ef1f41de165)

#### 2.) CPU dan Memory usage saat project berjalan tanpa input apapun
![image](https://github.com/user-attachments/assets/a5d3487e-5a9f-4749-8a81-a73b3264c02f)

#### 3.) CPU dan Memory usage saat project berjalan dengan input 3 dan 19
![image](https://github.com/user-attachments/assets/df6e7e29-9935-4563-992c-fbb6747c2355)

#### 4.) CPU dan Memory usage saat project berjalan dengan input 9 dan 30
![image](https://github.com/user-attachments/assets/591d5ceb-dc45-4814-a576-912f61d17b58)

<br>

## MENAMBAHKAN UNIT TESTING
#### 1.) Buat folder test dan file untuk unit testing
test/logic.test.js
```js
const { CariNilaiPangkat } = require('../logic');

describe('CariNilaiPangkat', () => {
    test('should return 1 if b is 0', () => {
        expect(CariNilaiPangkat(0, 0)).toBe(1);
    });

    test('should return -1 if b is negative', () => {
        expect(CariNilaiPangkat(5, -2)).toBe(-1);
    });

    test('should return -2 if b > 10 or a > 100', () => {
        expect(CariNilaiPangkat(5, 11)).toBe(-2);
        expect(CariNilaiPangkat(101, 2)).toBe(-2);
    });

    test('should return -3 if result exceeds MAX_SAFE_INTEGER', () => {
        expect(CariNilaiPangkat(100, 10)).toBe(-3);
    });

    test('should return correct power for normal cases', () => {
        expect(CariNilaiPangkat(2, 5)).toBe(32);
    });
});
```
![image](https://github.com/user-attachments/assets/9b2dde01-56db-49f5-8bec-694ccfa0879f)

#### 2.) Cek hasil unit testing
```
npm test
```
![image](https://github.com/user-attachments/assets/b9873b37-0c9d-474a-9010-4092c6d35b8a)

<br>

#### Penjelasan
Program tugas Jurnal Modul 12 menggunakan Node.js dan Electron untuk membangun antarmuka grafis (GUI). GUI dibuat dalam file index.html, yang berisi dua buah input textbox untuk menerima nilai, satu tombol untuk melakukan perhitungan, dan satu label untuk menampilkan hasil keluaran.

Logika utama program terletak pada fungsi CariNilaiPangkat(a, b) di dalam file logic.js. Fungsi ini menghitung nilai pemangkatan a^b menggunakan iterasi manual tanpa fungsi bawaan seperti Math.pow(). Fungsi ini memiliki beberapa aturan khusus: mengembalikan 1 jika b = 0, -1 jika b negatif, -2 jika a > 100 atau b > 10, dan -3 jika hasil pemangkatan melebihi batas aman bilangan integer JavaScript (Number.MAX_SAFE_INTEGER).

File renderer.js digunakan untuk menangani interaksi antarmuka. Saat pengguna menekan tombol “Hitung”, script akan mengambil nilai dari kedua textbox, memanggil fungsi CariNilaiPangkat, dan menampilkan hasilnya pada elemen label. Sedangkan file main.js berfungsi sebagai entry point aplikasi Electron yang membuat jendela utama dan memuat tampilan GUI dari file HTML.

Untuk pengujian, unit test disusun menggunakan framework Jest dalam file logic.test.js. Pengujian ini mencakup seluruh percabangan logika dalam fungsi CariNilaiPangkat agar tercapai cakupan pengujian (branch coverage) yang baik.
