<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Pendahuluan 7</h3>

<br>

## IMPLEMENTASI RUNTIME CONFIGURATION
#### covid_config.json 
```js
{
    "satuan_suhu": "celcius",
    "batas_hari_deman": 14,
    "pesan_ditolak": "Anda tidak diperbolehkan masuk ke dalam gedung ini",
    "pesan_diterima": "Anda dipersilahkan untuk masuk ke dalam gedung ini"
}
```

#### covidConfig.js
```js
const fs = require('fs');
const path = './covid_config.json';

class CovidConfig {
    constructor() {
        const defaults = {
            satuan_suhu: 'celcius',
            batas_hari_deman: 14,
            pesan_ditolak: 'Anda tidak diperbolehkan masuk ke dalam gedung ini',
            pesan_diterima: 'Anda dipersilahkan untuk masuk ke dalam gedung ini'
        };

        if (fs.existsSync(path)) {
            const data = fs.readFileSync(path);
            Object.assign(this, defaults, JSON.parse(data));
        } else {
            Object.assign(this, defaults);
        }
    }

    saveConfig() {
        fs.writeFileSync(path, JSON.stringify(this, null, 2));
    }

    ubahSatuan() {
        this.satuan_suhu = this.satuan_suhu === 'celcius' ? 'fahrenheit' : 'celcius';
        this.saveConfig();
    }
}

module.exports = CovidConfig;
```

#### index.js
```js
const readline = require('readline');
const CovidConfig = require('./covidConfig');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const config = new CovidConfig();

function tanyaSuhu() {
    rl.question(`Berapa suhu badan anda saat ini? Dalam nilai ${config.satuan_suhu}: `, (suhuInput) => {
        const suhu = parseFloat(suhuInput);
        if (isNaN(suhu)) {
            console.log("Masukkan angka yang valid untuk suhu.");
            return tanyaSuhu();
        }
        tanyaHari(suhu);
    });
}

function tanyaHari(suhu) {
    rl.question('Berapa hari yang lalu (perkiraan) anda terakhir memiliki gejala demam? ', (hariInput) => {
        const hari = parseInt(hariInput);
        if (isNaN(hari)) {
            console.log("Masukkan angka yang valid untuk hari.");
            return tanyaHari(suhu);
        }
        evaluasi(suhu, hari);
        rl.close();
    });
}

function evaluasi(suhu, hari) {
    let suhuNormal = false;
    if (config.satuan_suhu === 'celcius') {
        suhuNormal = suhu >= 36.5 && suhu <= 37.5;
    } else if (config.satuan_suhu === 'fahrenheit') {
        suhuNormal = suhu >= 97.7 && suhu <= 99.5;
    }

    if (suhuNormal && hari < config.batas_hari_deman) {
        console.log(config.pesan_diterima);
    } else {
        console.log(config.pesan_ditolak);
    }
}

tanyaSuhu();
```

#### Output
![image](https://github.com/user-attachments/assets/307a82fc-1433-4a3d-bb31-c50505b9ec90)

#### Penjelasan
Program ini adalah implementasi runtime configuration dalam aplikasi Node.js yang digunakan untuk menyaring izin masuk seseorang ke dalam gedung berdasarkan suhu tubuh dan riwayat demam. Konfigurasi runtime disimpan dalam file covid_config.json yang berisi pengaturan seperti satuan suhu (celcius atau fahrenheit), batas maksimum hari setelah gejala demam (batas_hari_deman), dan pesan yang ditampilkan jika pengguna diterima atau ditolak masuk.

File covidConfig.js berfungsi sebagai modul kelas CovidConfig yang membaca konfigurasi dari file JSON saat diinisialisasi. Jika file tidak ditemukan, maka akan digunakan nilai default. Kelas ini juga memiliki method saveConfig() untuk menyimpan perubahan ke file konfigurasi, dan ubahSatuan() untuk mengganti satuan suhu dari Celcius ke Fahrenheit atau sebaliknya, kemudian menyimpannya kembali.

Pada file utama index.js, digunakan modul readline untuk menerima input dari pengguna via terminal. Pertama, program akan menanyakan suhu badan pengguna dengan memperhatikan satuan yang ditentukan dalam konfigurasi. Setelah suhu dimasukkan, program akan menanyakan berapa hari yang lalu pengguna terakhir mengalami demam. Nilai-nilai ini kemudian dievaluasi dalam fungsi evaluasi() yang menentukan apakah suhu pengguna berada dalam rentang normal (sesuai dengan satuan) dan apakah jumlah hari sejak demam terakhir masih dalam batas yang diizinkan.

Jika kedua kondisi terpenuhi (suhu normal dan hari < batas), maka pengguna akan melihat pesan_diterima, jika tidak maka pesan_ditolak akan ditampilkan. Dengan desain ini, program memungkinkan fleksibilitas tinggi karena pengaturan dapat diubah tanpa menyentuh kode utama, cukup dengan memodifikasi file covid_config.json.
