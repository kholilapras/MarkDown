<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Modul 8</h3>

<br>

## IMPLEMENTASI RUNTIME CONFIGURATION
#### bank_transfer_config.json 
```js
{
    "lang": "id",
    "transfer": {
        "threshold": 25000000,
        "low_fee": 6500,
        "high_fee": 15000
    },
    "methods": [
        "RTO (real-time)",
        "SKN",
        "RTGS",
        "BI FAST"
    ],
    "confirmation": {
        "en": "yes",
        "id": "ya"
    }
}
```

#### BankTransferConfig.js
```js
const fs = require('fs');

class BankTransferConfig {
    constructor() {
        this.configFile = 'bank_transfer_config.json';
        this.defaultConfig = {
            lang: 'en',
            transfer: {
                threshold: 25000000,
                low_fee: 6500,
                high_fee: 15000
            },
            methods: ['RTO (real-time)', 'SKN', 'RTGS', 'BI FAST'],
            confirmation: {
                en: 'yes',
                id: 'ya'
            }
        };
        this.config = this.loadConfig();
    }

    loadConfig() {
        if (fs.existsSync(this.configFile)) {
            const content = fs.readFileSync(this.configFile);
            return JSON.parse(content);
        } else {
            return this.defaultConfig;
        }
    }
}

module.exports = BankTransferConfig;
```

#### index.js
```js
const readline = require('readline');
const BankTransferConfig = require('./BankTransferConfig');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const config = new BankTransferConfig().config;
const lang = config.lang;

function ask(question) {
    return new Promise((resolve) => rl.question(question, resolve));
}

(async () => {
    const prompt = lang === 'en' ? 'Please insert the amount of money to transfer: ' : 'Masukkan jumlah uang yang akan di-transfer: ';
    const amount = parseInt(await ask(prompt));

    const fee = amount <= config.transfer.threshold
        ? config.transfer.low_fee
        : config.transfer.high_fee;

    const total = amount + fee;

    if (lang === 'en') {
        console.log(`Transfer fee = ${fee}`);
        console.log(`Total amount = ${total}`);
    } else {
        console.log(`Biaya transfer = ${fee}`);
        console.log(`Total biaya = ${total}`);
    }

    const methodPrompt = lang === 'en' ? 'Select transfer method:' : 'Pilih metode transfer:';
    console.log(methodPrompt);
    config.methods.forEach((method, index) => {
        console.log(`${index + 1}. ${method}`);
    });

    await ask(lang === 'en' ? 'Choose a method by number: ' : 'Pilih metode dengan angka: ');

    const confirmPrompt = lang === 'en'
        ? `Please type "${config.confirmation.en}" to confirm the transaction: `
        : `Ketik "${config.confirmation.id}" untuk mengkonfirmasi transaksi: `;

    const confirmation = await ask(confirmPrompt);

    if (
        (lang === 'en' && confirmation === config.confirmation.en) ||
        (lang === 'id' && confirmation === config.confirmation.id)
    ) {
        console.log(lang === 'en' ? 'The transfer is completed' : 'Proses transfer berhasil');
    } else {
        console.log(lang === 'en' ? 'Transfer is cancelled' : 'Transfer dibatalkan');
    }

    rl.close();
})();
```

#### Output
![image](https://github.com/user-attachments/assets/4fa07b34-8675-4f6d-9106-9f6624bbc5da)

#### Penjelasan
 file bank_transfer_config.json berisi konfigurasi dalam format JSON, yang menentukan bahasa (lang), batas nominal (threshold) untuk perhitungan biaya transfer, nilai biaya transfer untuk jumlah di bawah dan di atas batas (low_fee dan high_fee), daftar metode transfer yang tersedia (methods), serta kata kunci konfirmasi berdasarkan bahasa (confirmation). File ini memungkinkan perubahan perilaku program tanpa perlu mengubah kode sumber.

Kemudian, kelas BankTransferConfig di BankTransferConfig.js bertanggung jawab untuk memuat konfigurasi. Ia memeriksa apakah file konfigurasi tersedia. Jika ya, isinya dibaca dan di-parse menjadi objek JavaScript. Jika tidak, program akan menggunakan konfigurasi default yang sudah ditentukan di dalam kelas. Hal ini memberikan fleksibilitas karena program bisa tetap berjalan meskipun file konfigurasi tidak tersedia.

Terakhir, file index.js adalah entry point utama program yang menggunakan modul readline untuk berinteraksi dengan pengguna melalui terminal. Program membaca nilai konfigurasi dari instance BankTransferConfig dan menggunakan bahasa (lang) yang sesuai untuk menampilkan pesan-pesan interaktif. Pengguna diminta memasukkan nominal transfer, lalu program menghitung biaya berdasarkan apakah jumlah transfer melebihi threshold atau tidak, dan menampilkan totalnya. Kemudian, pengguna diminta memilih metode transfer dari daftar metode yang tersedia. Setelah itu, pengguna diminta mengonfirmasi transaksi dengan mengetikkan kata konfirmasi sesuai bahasa yang dipilih. Jika konfirmasi sesuai, transfer dianggap berhasil; jika tidak, transaksi dibatalkan. Program ditutup dengan memanggil rl.close() untuk mengakhiri interface interaktif.

Secara teknis, program ini menerapkan konsep runtime configuration, handling input/output interaktif, conditional logic, dan error handling dasar dalam pembacaan file. Hal ini membuatnya fleksibel dan mudah disesuaikan untuk kebutuhan simulasi transfer bank dengan berbagai konfigurasi.
