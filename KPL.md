<h1>Konsruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Pendahuluan Modul 5</h3>

## halogeneric.js
#### Source Code
```js
class HaloGeneric {
    SapaUser(user) {
      console.log(`Halo user ${user}`);
    }
  }
  
  const halo = new HaloGeneric();
  halo.SapaUser("Kholil");
```
#### Output
![image](https://github.com/user-attachments/assets/ac4a7e9e-e626-4bdb-b7b2-45bdffeb2f66)

#### Penjelasan
kelas HaloGeneric yang memiliki satu metode bernama SapaUser. Metode ini menerima satu parameter, yaitu user, dan mencetak pesan ke konsol dalam format Halo user [nama]. Setelah kelas didefinisikan, sebuah objek baru dari kelas tersebut dibuat dan disimpan dalam variabel halo. Kemudian, metode SapaUser dipanggil dengan argumen, sehingga menghasilkan output di konsol. Program ini menunjukkan konsep dasar OOP (Object-Oriented Programming) di JavaScript, yaitu penggunaan kelas dan instansiasi objek untuk mengorganisasi kode secara modular.

## datageneric.js
#### Source Code
```js
class DataGeneric {
    constructor(data) {
      this.data = data;
    }
  
    PrintData() {
      console.log(`Data yang tersimpan adalah: ${this.data}`);
    }
  }
  
  const nim = new DataGeneric("2211104071");
  nim.PrintData();
```
#### Output
![image](https://github.com/user-attachments/assets/f3866c1e-20b1-42bd-b53a-d37ccd77422f)

#### Penjelasan
kelas JavaScript DataGeneric memiliki konstruktor untuk menginisialisasi properti data dengan nilai yang diberikan saat objek dibuat. Kelas ini juga memiliki metode PrintData yang mencetak nilai data ke konsol dalam format. Dalam contoh penggunaan, sebuah objek dari kelas DataGeneric dibuat dengan nilai "2211104071" dan disimpan dalam variabel nim. Kemudian, metode PrintData dipanggil, sehingga output yang muncul di konsol adalah: Data yang tersimpan adalah: 2211104071. Program ini menunjukkan prinsip enkapsulasi dalam OOP, di mana data disimpan dalam objek dan diakses melalui metode tertentu.
