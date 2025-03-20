<h1>Konsruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Modul 4</h3>

## KodeBuah.js
#### Source Code
```js
class KodeBuah {
    constructor() {
        this.tabelKodeBuah = {
            "Apel": "A00",
            "Aprikot": "B00",
            "Alpukat": "C00",
            "Pisang": "D00",
            "Paprika": "E00",
            "Kurma": "K00",
            "Durian": "L00",
            "Anggur": "M00",
            "Melon": "N00",
            "Semangka": "O00"
        };
    }

    getKodeBuah(namaBuah) {
        return this.tabelKodeBuah[namaBuah] || "Kode tidak ditemukan";
    }
}

const kodeBuah = new KodeBuah();
console.log("Kode Buah Apel:", kodeBuah.getKodeBuah("Apel"));
```
#### Output
![image](https://github.com/user-attachments/assets/82bae9b9-c43a-4bbb-b94f-b2645396b295)

#### Penjelasan
KodeBuah adalah sebuah kelas dalam JavaScript yang berfungsi untuk menyimpan dan mengambil kode unik dari berbagai jenis buah. Kelas ini memiliki properti tabelKodeBuah, sebuah objek yang memetakan nama buah ke kode spesifiknya. Metode getKodeBuah(namaBuah) digunakan untuk mencari kode berdasarkan nama buah yang diberikan. Jika nama buah tidak ditemukan dalam tabel, metode ini akan mengembalikan pesan "Kode tidak ditemukan". Contoh penggunaan kelas ini mencetak kode buah untuk "Apel" ke konsol.

## PosisiKarakterGame.js
#### Source Code
```js
class PosisiKarakterGame {
    constructor(NIM) {
        this.state = "Berdiri";
        this.NIM = NIM;
    }

    ubahState(aksi) {
        if (this.NIM % 3 === 0) {
            if (aksi === "S") console.log("Tombol arah bawah ditekan");
            if (aksi === "W") console.log("Tombol arah atas ditekan");
        } else if (this.NIM % 3 === 1) {
            if (this.state === "Berdiri") console.log("Posisi standby");
            if (this.state === "Tengkurap") console.log("Posisi istirahat");
        } else if (this.NIM % 3 === 2) {
            if (this.state === "Terbang" && aksi === "Jongkok") console.log("Posisi landing");
            if (this.state === "Berdiri" && aksi === "Terbang") console.log("Posisi take off");
        }
        this.state = aksi;
    }
}

const karakter = new PosisiKarakterGame(2211104071);
karakter.ubahState("Berdiri");
karakter.ubahState("Terbang");
karakter.ubahState("Jongkok");
```
#### Output
![image](https://github.com/user-attachments/assets/0ad003f2-775e-41c2-bf38-4a4ea5a31eed)

#### Penjelasan
PosisiKarakterGame adalah sebuah kelas dalam JavaScript yang merepresentasikan status karakter dalam game berdasarkan nilai NIM. Kelas ini memiliki properti state yang menyimpan status karakter dan diinisialisasi dengan nilai "Berdiri". Metode ubahState(aksi) mengubah status karakter sesuai dengan aturan berbasis hasil modulus NIM % 3. Jika hasilnya 0, karakter merespons tombol "S" dan "W". Jika hasilnya 1, karakter menampilkan statusnya saat "Berdiri" atau "Tengkurap". Jika hasilnya 2, karakter dapat "Terbang" atau "Landing" berdasarkan aksi yang diberikan.
