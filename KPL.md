<h1>Konsruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Modul 5</h3>

## penjumlahan.js
#### Source Code
```js
class Penjumlahan {
    static JumlahTigaAngka(a, b, c) {
      return a + b + c;
    }
  }
  
  const NIM = "2211104071";
  
  const angka1 = NIM.substring(0, 2);
  const angka2 = NIM.substring(2, 4);
  const angka3 = NIM.substring(4, 6);
  
  const akhir = parseInt(NIM[NIM.length - 1]);
  
  let input1, input2, input3;
  
  if (akhir === 1 || akhir === 2) {
    input1 = parseFloat(angka1);
    input2 = parseFloat(angka2);
    input3 = parseFloat(angka3);
  } else if ([3, 4, 5].includes(akhir)) {
    input1 = parseFloat(angka1);
    input2 = parseFloat(angka2);
    input3 = parseFloat(angka3);
  } else if ([6, 7, 8].includes(akhir)) {
    input1 = parseInt(angka1, 10);
    input2 = parseInt(angka2, 10);
    input3 = parseInt(angka3, 10);
  } else if (akhir === 9 || akhir === 0) {
    input1 = BigInt(angka1);
    input2 = BigInt(angka2);
    input3 = BigInt(angka3);
  }
  
  const hasil = Penjumlahan.JumlahTigaAngka(input1, input2, input3);
  
  console.log(`Hasil penjumlahan dari ${input1}, ${input2}, dan ${input3} adalah: ${hasil}`);  
```
#### Output
![image](https://github.com/user-attachments/assets/2ad3dbf3-c633-4465-832d-ad038bbb27a6)

#### Penjelasan
Kelas Penjumlahan memiliki metode statis JumlahTigaAngka yang menjumlahkan tiga nilai input. NIM dipecah menjadi tiga bagian: dua digit pertama, dua digit berikutnya, dan dua digit setelahnya. Digit terakhir dari NIM digunakan untuk menentukan tipe data dari angka-angka yang akan dijumlahkan: jika berakhir dengan 1–5, maka angka dikonversi ke float; jika 6–8, dikonversi ke int; dan jika 9 atau 0, dikonversi ke BigInt. Hasil dari penjumlahan kemudian ditampilkan di konsol. Program ini mendemonstrasikan penggunaan logika kondisi serta manipulasi string dan tipe data dalam JavaScript.

## simpleDatabase.js
#### Source Code
```js
class SimpleDataBase {
    constructor() {
      this.storedData = [];
      this.inputDates = [];
    }
  
    AddNewData(data) {
      this.storedData.push(data);
      this.inputDates.push(new Date());
    }
  
    PrintAllData() {
      for (let i = 0; i < this.storedData.length; i++) {
        console.log(
          `Data ${i + 1} berisi: ${this.storedData[i]}, yang disimpan pada waktu UTC: ${this.inputDates[i].toUTCString()}`
        );
      }
    }
  }
  
const myData = new SimpleDataBase();

myData.AddNewData(12);
myData.AddNewData(34);
myData.AddNewData(56);
myData.PrintAllData();  
```
#### Output
![image](https://github.com/user-attachments/assets/b6186058-d36e-4e75-9788-7700cddb3bf4)

#### Penjelasan
kelas SimpleDataBase berfungsi untuk menyimpan data beserta waktu penyimpanannya. Di dalam kelas terdapat dua properti: storedData untuk menyimpan nilai-nilai data, dan inputDates untuk mencatat waktu penyimpanan data menggunakan objek Date. Metode AddNewData(data) digunakan untuk menambahkan data baru ke dalam array storedData dan secara otomatis mencatat waktu saat data ditambahkan ke dalam inputDates. Sementara itu, metode PrintAllData() digunakan untuk mencetak semua data beserta waktu penyimpanannya dalam format waktu UTC. Di bagian akhir program, sebuah objek myData dari kelas SimpleDataBase dibuat, lalu tiga data numerik dimasukkan, dan seluruh data dicetak ke konsol. Program ini menunjukkan penggunaan array paralel dan pengelolaan data dengan informasi waktu.
