<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Pendahuluan Pertemuan 10</h3>

<br>

## MEMBUAT LIBRARY ALJABAR
#### 1.) Buat Folder Library Project
```
mkdir <nama-library>
```
```
cd <nama-library>
```
![image](https://github.com/user-attachments/assets/56bead3e-9786-4804-acbc-dd7ea1262887)

#### 2.) Buat npm init pada folder library project
```
npm init
```
![image](https://github.com/user-attachments/assets/bcfa3d61-2043-496e-b630-00b31162e495)

#### 3.) Buka Folder dan tambahkan file dan sourcecode untuk membuat library project
Buat file index.js lalu tambahkan Sourcecode dibawah ini
```
function AkarPersamaanKuadrat([a, b, c]) {
    const D = b ** 2 - 4 * a * c;
    if (D < 0) return []; // Tidak ada akar real
    const akarD = Math.sqrt(D);
    return [(-b + akarD) / (2 * a), (-b - akarD) / (2 * a)];
}

function HasilKuadrat([a, b]) {
    return [a ** 2, 2 * a * b, b ** 2];
}

module.exports = { AkarPersamaanKuadrat, HasilKuadrat };
```
![image](https://github.com/user-attachments/assets/567ac92e-ec89-42b6-b116-e697ea77bc4d)

#### 4.) Login ke NPM pada terminal library project
Pastikan sudah sudah memiliki akun di https://www.npmjs.com
```
npm login
```
![image](https://github.com/user-attachments/assets/e70c5167-2830-4a93-9875-9c23766b315c)

#### 5.) Publikasi ke NPM
Pastikan nama library unik
```
npm publish --access public
```
![image](https://github.com/user-attachments/assets/48a1b06b-cc59-49c4-aad7-5bba738b8675)

#### 5.) Cek Library NPM
Login ke https://www.npmjs.com lalu klik icon profile dan klik bagian packages
![image](https://github.com/user-attachments/assets/196cedb3-05ae-4346-8ba6-4989859b0fab)

<br>

## MEMANGGIL LIBRARY DI FUNGSI UTAMA
#### 1.) Buat Project Baru

#### 2.) Pilih Library yang akan digunakan
![image](https://github.com/user-attachments/assets/fd828b4e-13aa-4bf6-835d-721a28070d8a)

#### 3.) Install Library ke project
```
npm i <nama-library>
```
![image](https://github.com/user-attachments/assets/3bd5fb30-bf73-49ff-b6a8-ce005b42b581)

#### 4.) Tambahkan Sourcecode
sourcecode
```js
const { AkarPersamaanKuadrat, HasilKuadrat } = require('aljbr-kholil');

console.log(AkarPersamaanKuadrat([1, -3, -10]));
console.log(HasilKuadrat([2, -3]));
```
![image](https://github.com/user-attachments/assets/e01050b6-0f2b-465b-95be-24f5709a58ed)

#### 5.) Run Project
![image](https://github.com/user-attachments/assets/75ca6823-2741-4962-9495-427cdea1f214)

#### Penjelasan
Pada project ini dibuat sebuah library Node.js yang berfungsi untuk melakukan dua operasi matematika dasar terkait persamaan: mencari akar-akar dari persamaan kuadrat dan menghitung hasil kuadrat dari persamaan linier. File index.js dalam folder mendefinisikan dua fungsi, yaitu AkarPersamaanKuadrat dan HasilKuadrat.

Fungsi AkarPersamaanKuadrat menerima sebuah array berisi tiga angka yang mewakili koefisien a, b, dan c dari persamaan kuadrat dalam bentuk umum (ax^2 + bx + c = 0). Fungsi ini menghitung diskriminan D = b^2 - 4ac untuk menentukan akar-akarnya. Jika nilai diskriminan negatif, maka fungsi mengembalikan array kosong karena tidak ada akar real. Jika diskriminan bernilai nol atau positif, fungsi akan menghitung dan mengembalikan dua akar real menggunakan rumus kuadrat standar.

Sementara itu, fungsi HasilKuadrat digunakan untuk menghitung hasil kuadrat dari suatu persamaan linier dalam bentuk (ax + b). Fungsi ini menerima array berisi dua angka, yaitu a dan b, kemudian mengembalikan array berisi koefisien dari hasil kuadratnya, yaitu a^2x^2 + 2abx + b^2, sesuai dengan identitas kuadrat sempurna.

Pada file utama index.js, kedua fungsi tersebut diimpor menggunakan require dan kemudian diuji dengan dua contoh input. Fungsi AkarPersamaanKuadrat dipanggil dengan input [1, -3, -10] yang mewakili persamaan x^2 - 3x - 10, dan hasilnya adalah dua akar: 5 dan -2. Sedangkan HasilKuadrat dipanggil dengan input [2, -3] yang mewakili persamaan 2x - 3, dan hasil kuadratnya adalah 4x^2 - 12x + 9. Hasil dari kedua fungsi ini ditampilkan di console menggunakan console.log, untuk memastikan bahwa library berfungsi sesuai yang diharapkan.


