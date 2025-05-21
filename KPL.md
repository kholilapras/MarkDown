<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Pendahuluan Pertemuan 12</h3>

<br>

## MEMBUAT PROJECT GUI BARU
#### 1.) Buat Folder Project Baru lalu buka terminal
![image](https://github.com/user-attachments/assets/495a4276-4a6c-476a-930c-b00b38994a7b)

#### 2.) Inisialisasi Project
```
npm init -y
```
```
npm install electron jest --save-dev
```
![image](https://github.com/user-attachments/assets/91e2262f-adac-4db9-a822-476e1f8285a7)


#### 2.) Konfigurasi package.json
![image](https://github.com/user-attachments/assets/9a7e1a03-7522-4ee4-a300-074d122254be)

<br>

## MEMBUAT GUI SEDERHANA
#### 1.) Tambahkan file main.js
```js
const { app, BrowserWindow } = require('electron');

function createWindow() {
  const win = new BrowserWindow({
    width: 400,
    height: 300,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false
    }
  });

  win.loadFile('index.html');
}

app.whenReady().then(createWindow);
```

#### 2.) Tambahkan file index.html
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>TP Modul 12</title>
</head>
<body>
  <h3>Masukkan Angka:</h3>
  <input type="number" id="input" />
  <button onclick="proses()">Cek Tanda</button>
  <p id="output"></p>

  <script src="renderer.js"></script>
</body>
</html>
```

#### 3.) Tambahkan file renderer.js
```js
const { CariTandaBilangan } = require('./logic');

function proses() {
  const input = parseInt(document.getElementById("input").value);
  const result = CariTandaBilangan(input);
  document.getElementById("output").innerText = result;
}
```

#### 4.) Tambahkan file logic.js
```js
function CariTandaBilangan(a) {
  if (a < 0) return "Negatif";
  if (a > 0) return "Positif";
  return "Nol";
}

module.exports = { CariTandaBilangan };
```
<br>

## MELAKUKAN SOFTWARE PROFILING
#### 1.) CPU dan Memory usage saat project berjalan tanpa input apapun
![image](https://github.com/user-attachments/assets/7d0d413f-2ef2-40e2-b683-f1cf1c255b02)

#### 2.) CPU dan Memory usage saat project berjalan dengan input angka
![image](https://github.com/user-attachments/assets/081378ab-47c0-4689-a50d-202737646337)

<br>

## MENAMBAHKAN UNIT TESTING
#### 1.) Buat folder dan file untuk unit testing
__tests__/logic.test.js
```js
const { CariTandaBilangan } = require('../logic');

test('Angka negatif', () => {
  expect(CariTandaBilangan(-5)).toBe('Negatif');
});

test('Angka positif', () => {
  expect(CariTandaBilangan(7)).toBe('Positif');
});

test('Angka nol', () => {
  expect(CariTandaBilangan(0)).toBe('Nol');
});
```
![image](https://github.com/user-attachments/assets/9d561a2f-d0a3-4bbf-aea5-e2138c229a42)

#### 2.) Cek hasil unit testing
```
npm test
```
![image](https://github.com/user-attachments/assets/330e2626-0bd6-4e87-82f7-c9fb218ba2f1)

<br>

#### Penjelasan
Program ini dibuat menggunakan Electron untuk membangun antarmuka grafis (GUI) dan Node.js sebagai backend logika aplikasi serta pengujian. File utama main.js bertindak sebagai entry point aplikasi Electron, di mana sebuah jendela GUI dibuat dan file index.html dimuat sebagai tampilan utama. Jendela ini memiliki ukuran yang telah ditentukan dan mengaktifkan fitur nodeIntegration agar file JavaScript frontend dapat mengakses modul Node.js.

File index.html berisi elemen-elemen dasar antarmuka, yaitu sebuah input angka (textbox), sebuah tombol (button) untuk memicu proses klasifikasi, dan sebuah paragraf (label) untuk menampilkan hasil. Ketika pengguna memasukkan angka dan menekan tombol, fungsi proses() yang didefinisikan dalam renderer.js akan dijalankan. Fungsi ini membaca nilai dari input, mengubahnya menjadi bilangan bulat, lalu memanggil fungsi CariTandaBilangan dari logic.js untuk mengklasifikasikan angka sebagai “Negatif”, “Positif”, atau “Nol”.

Fungsi CariTandaBilangan(a) dalam file logic.js adalah inti logika program. Fungsi ini menerima satu parameter a dan mengembalikan string berdasarkan nilai a: jika lebih kecil dari 0, hasilnya “Negatif”; jika lebih besar dari 0, hasilnya “Positif”; dan jika sama dengan 0, hasilnya “Nol”. Fungsi ini dipanggil dari frontend dan hasilnya langsung ditampilkan pada elemen paragraf.

Untuk memastikan bahwa logika bekerja sesuai harapan, file __tests__/logic.test.js menggunakan framework Jest untuk menguji fungsi CariTandaBilangan. Tiga pengujian dilakukan untuk mencakup semua kemungkinan cabang kondisi: angka negatif, positif, dan nol. Dengan demikian, branch coverage dari fungsi dapat dikatakan sangat baik.
