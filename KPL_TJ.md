<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Pertemuan 10</h3>

<br>

## MEMBUAT LIBRARY ALJABAR
#### 1.) Buat Folder Library Project
```
mkdir <nama-library>
```
```
cd <nama-library>
```
![image](https://github.com/user-attachments/assets/13cfbcc4-eab0-4139-8cf4-eb5f5223257c)

#### 2.) Buat npm init pada folder library project
```
npm init
```
![image](https://github.com/user-attachments/assets/6a4fc38d-793c-433a-9761-38307a8ff4d6)

#### 3.) Buka Folder dan tambahkan file dan sourcecode untuk membuat library project
Buat file index.js lalu tambahkan Sourcecode dibawah ini
```
function FPB(a, b) {
  while (b !== 0) {
    const temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

function KPK(a, b) {
  return (a * b) / FPB(a, b);
}

function Turunan(persamaan) {
  const turunan = [];
  const n = persamaan.length - 1;
  for (let i = 0; i < n; i++) {
    const pangkat = n - i;
    const koef = persamaan[i];
    const hasil = koef * pangkat;
    if (hasil === 0) continue;
    let str = `${hasil}`;
    if (pangkat - 1 > 0) str += `x${pangkat - 1 > 1 ? `^${pangkat - 1}` : ""}`;
    turunan.push(str);
  }
  return turunan.join(" + ").replace(/\+ -/g, "- ");
}

function Integral(persamaan) {
  const hasil = [];
  const n = persamaan.length - 1;
  for (let i = 0; i <= n; i++) {
    const pangkat = n - i + 1;
    const koef = persamaan[i];
    const nilai = koef / pangkat;
    let str = `${nilai !== 1 ? nilai : ""}`;
    str += `x${pangkat > 1 ? `^${pangkat}` : ""}`;
    hasil.push(str);
  }
  hasil.push("C");
  return hasil.join(" + ").replace(/\+ -/g, "- ");
}

module.exports = { FPB, KPK, Turunan, Integral };
```
![image](https://github.com/user-attachments/assets/7fd0c6b8-5a33-40dc-87f2-eb2a80c76314)

#### 4.) Login ke NPM pada terminal library project
Pastikan sudah sudah memiliki akun di https://www.npmjs.com
```
npm login
```
![image](https://github.com/user-attachments/assets/a12465c6-1e61-4e4e-9d81-a8071b10dcce)

#### 5.) Publikasi ke NPM
Pastikan nama library unik
```
npm publish --access public
```
![image](https://github.com/user-attachments/assets/5afd7ee4-166b-4fec-ab72-c4412da0bf09)

#### 5.) Cek Library NPM
Login ke https://www.npmjs.com lalu klik icon profile dan klik bagian packages
![image](https://github.com/user-attachments/assets/7267bf67-79c4-4964-b835-9dc7c5010e8c)

<br>

## MEMANGGIL LIBRARY DI FUNGSI UTAMA
#### 1.) Buat Project Baru

#### 2.) Pilih Library yang akan digunakan
![image](https://github.com/user-attachments/assets/bf4ec552-0eec-4d07-8d50-d285a1ac81fb)

#### 3.) Install Library ke project
```
npm i <nama-library>
```
![image](https://github.com/user-attachments/assets/ccc6cd35-f1ad-4858-b11e-4fa54306b669)

#### 4.) Tambahkan Sourcecode
Buat file index.js lalu tambahkan Sourcecode dibawah ini
```js
const { FPB, KPK, Turunan, Integral } = require('mtklib-tj10kpl');

console.log('FPB(60, 45) =', FPB(60, 45));
console.log('KPK(12, 8) =', KPK(12, 8));
console.log('Turunan([1, 4, -12, 9]) =', Turunan([1, 4, -12, 9]));
console.log('Integral([4, 6, -12, 9]) =', Integral([4, 6, -12, 9]));
```
![image](https://github.com/user-attachments/assets/90efb94e-b2f6-4393-8671-7b44467c7811)

#### 5.) Run Project
![image](https://github.com/user-attachments/assets/6ab26c2d-1e88-4f43-b063-4c565976009a)

#### Penjelasan
Folder mtklib-tj10kpl berfungsi sebagai modul library matematika. Di dalam file ini, kita mendefinisikan empat buah fungsi penting, yaitu FPB, KPK, Turunan, dan Integral. Fungsi FPB(a, b) digunakan untuk mencari Faktor Persekutuan Terbesar dari dua buah bilangan bulat dengan menggunakan algoritma Euclidean, yaitu dengan cara mencari sisa pembagian dan melakukan pertukaran nilai sampai salah satu nilainya menjadi nol. Selanjutnya, fungsi KPK(a, b) menghitung Kelipatan Persekutuan Terkecil dengan rumus (a × b) / FPB(a, b), yang memanfaatkan fungsi FPB yang telah dibuat sebelumnya.

Fungsi Turunan(persamaan) digunakan untuk menghitung turunan dari suatu polinomial yang diberikan dalam bentuk array koefisien. Misalnya, array \[1, 4, -12, 9] mewakili persamaan x³ + 4x² – 12x + 9. Fungsi ini bekerja dengan menghitung turunan masing-masing suku dengan mengalikan koefisien dengan pangkat aslinya lalu menurunkan pangkat tersebut satu tingkat. Hasil turunan kemudian diubah menjadi string matematika dengan format yang mudah dibaca, seperti “3x² + 8x - 12”. Kemudian, fungsi Integral(persamaan) menghitung integral tak tentu dari sebuah polinomial. Fungsi ini menambahkan satu tingkat pangkat ke setiap suku dan membagi koefisien dengan pangkat baru tersebut. Setelah seluruh suku diintegralkan, simbol “+ C” ditambahkan di akhir sebagai konstanta integrasi.

Seluruh fungsi ini diekspor menggunakan module.exports agar bisa digunakan di file lain. Lalu, pada file utama index.js, kita melakukan import terhadap seluruh fungsi mtklib-tj10kpl menggunakan sintaks require. Setelah itu, kita melakukan pemanggilan fungsi satu per satu dengan contoh nilai yang sesuai seperti FPB(60, 45), KPK(12, 8), Turunan(\[1, 4, -12, 9]), dan Integral(\[4, 6, -12, 9]). Setiap hasil pemanggilan fungsi kemudian ditampilkan ke console menggunakan console.log.

Dengan arsitektur ini, kita berhasil memisahkan antara logika matematika (library) dan aplikasi utama (console application), sesuai dengan prinsip modularitas dalam pemrograman. Struktur ini juga memudahkan pengujian ulang, pemeliharaan kode, dan memungkinkan penggunaan ulang fungsi-fungsi matematika di berbagai project lainnya.
