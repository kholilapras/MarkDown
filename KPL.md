<h1>Konsruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Pendahuluan 6</h3>

## sayaTubeVideo.js
#### Source Code
```js
class SayaTubeVideo {
    constructor(title) {
        if (typeof title !== 'string' || title === null || title.length === 0 || title.length > 100) {
            throw new Error("Judul video harus berupa string dengan panjang maksimal 100 karakter dan tidak null.");
        }

        this.id = Math.floor(10000 + Math.random() * 90000);
        this.title = title;
        this.playCount = 0;
    }

    increasePlayCount(count) {
        if (!Number.isInteger(count) || count < 0 || count > 10000000) {
            throw new Error("Input play count harus bilangan bulat antara 0 hingga 10.000.000.");
        }

        const maxInt = Number.MAX_SAFE_INTEGER;
        if (this.playCount + count > maxInt) {
            throw new Error("Penambahan play count melebihi batas maksimal integer.");
        }

        this.playCount += count;
    }

    printVideoDetails() {
        console.log("===== Video Details =====");
        console.log(`ID: ${this.id}`);
        console.log(`Title: ${this.title}`);
        console.log(`Play Count: ${this.playCount}`);
        console.log("=========================\n");
    }
}

function main() {
    try {
        const video = new SayaTubeVideo("Tutorial Design By Contract - Kholil");

        for (let i = 0; i < 10; i++) {
            try {
                video.increasePlayCount(1000000);
            } catch (err) {
                console.error("Error pada increasePlayCount:", err.message);
            }
        }

        video.printVideoDetails();
    } catch (err) {
        console.error("Error saat membuat object SayaTubeVideo:", err.message);
    }
}

main();
```
#### Output
![image](https://github.com/user-attachments/assets/7bd49266-3253-4a01-9314-fc355d0b4444)

#### Penjelasan
class SayaTubeVideo menggunakan prinsip Design by Contract di Node.js. Class ini merepresentasikan sebuah video dengan atribut id, title, dan playCount, di mana id dihasilkan secara acak, title divalidasi agar tidak kosong dan maksimal 100 karakter, serta playCount dimulai dari nol. Method increasePlayCount digunakan untuk menambahkan jumlah penonton dengan batas maksimal 10.000.000 per panggilan, serta memastikan tidak terjadi overflow menggunakan pengecekan terhadap Number.MAX_SAFE_INTEGER. Semua validasi dan potensi kesalahan ditangani menggunakan blok try-catch, sehingga program tetap berjalan meskipun terjadi error.
