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
![image](https://github.com/user-attachments/assets/2f9ae282-6455-43f5-82f9-fab2660395ab)

#### 2.) CPU dan Memory usage saat project berjalan tanpa input apapun
![image](https://github.com/user-attachments/assets/3afe2936-c51f-4400-a300-0f4bd4762b4d)

#### 3.) CPU dan Memory usage saat project berjalan dengan input 3 dan 19

#### 4.) CPU dan Memory usage saat project berjalan dengan input 9 dan 30

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
Program 
