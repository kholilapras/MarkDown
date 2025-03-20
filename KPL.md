<h1>Konsruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>TP Modul 4</h3>

#### KodePos.js
```js
class KodePos {
    constructor() {
        this.kodePosTable = {
            "Batununggal": "40266",
            "Kujangsari": "40287",
            "Mengger": "40267",
            "Wates": "40256",
            "Cijaura": "40287",
            "Jatisari": "40286",
            "Margasari": "40286",
            "Sekejati": "40286",
            "Kebonwaru": "40272",
            "Maleer": "40274",
            "Samoja": "40273"
        };
    }

    getKodePos(kelurahan) {
        return this.kodePosTable[kelurahan] || "Kode Pos tidak ditemukan";
    }
}

const kodePos = new KodePos();
console.log("Daftar Kode Pos");
for (const [kelurahan, kode] of Object.entries(kodePos.kodePosTable)) {
    console.log(`${kelurahan}: ${kode}`);
}

export default KodePos;
```
Kelas ini memiliki sebuah objek kodePosTable yang berisi daftar kelurahan beserta kode posnya. Metode getKodePos(kelurahan) memungkinkan pengguna untuk mencari kode pos berdasarkan nama kelurahan yang diberikan. Jika kelurahan tidak ditemukan, metode ini akan mengembalikan pesan "Kode Pos tidak ditemukan". Selain itu, kode ini juga mencetak daftar kelurahan beserta kode posnya ke konsol.

#### DoorMachine.js
```js
class DoorMachine {
    constructor() {
        this.state = "Terkunci";
        console.log("Pintu terkunci");
    }

    unlock() {
        if (this.state === "Terkunci") {
            this.state = "Terbuka";
            console.log("Pintu tidak terkunci");
        }
    }

    lock() {
        if (this.state === "Terbuka") {
            this.state = "Terkunci";
            console.log("Pintu terkunci");
        }
    }
}

const door = new DoorMachine();
console.log("Membuka pintu...");
door.unlock();

console.log("Mengunci pintu kembali...");
door.lock();

export default DoorMachine;
```
DoorMachine adalah sebuah kelas dalam JavaScript yang merepresentasikan mekanisme pintu dengan dua status: "Terkunci" dan "Terbuka". Kelas ini memiliki properti state yang menyimpan status pintu, yang secara default diatur ke "Terkunci" dan ditampilkan di konsol saat objek dibuat. Terdapat dua metode utama: unlock(), yang mengubah status pintu menjadi "Terbuka" jika sebelumnya "Terkunci", dan lock(), yang mengembalikan status menjadi "Terkunci" jika sebelumnya "Terbuka". Saat dipanggil, metode ini mencetak status pintu ke konsol.
