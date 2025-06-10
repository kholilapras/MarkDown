<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Pendahuluan Pertemuan 14</h3>

<br>

# REFACTORING DENGAN STANDAR CODE
Dengan mengikuti standard code yang digunakan (misal C# dengan standar dari .NET), pastikan kode yang
dikumpulkan memenuhi faktor-faktor berikut:  
A. Naming convention  
i. Variable / Property / Attribute  
ii. Method / Function / Procedure  
B. White space dan indentation  
C. Variable / attribute declarations  
D. Comments  

#### SourceCode
main.js
```js
// Interface Subject
class WeatherStation {
    constructor() {
        this._observers = [];           // Daftar observer yang terdaftar
        this._temperature = 0;          // Nilai suhu saat ini
    }

    // Menambahkan observer ke daftar
    attach(observer) {
        this._observers.push(observer);
    }

    // Menghapus observer dari daftar
    detach(observer) {
        this._observers = this._observers.filter(obs => obs !== observer);
    }

    // Memberi notifikasi ke semua observer
    notifyObservers() {
        this._observers.forEach(observer => {
            observer.update(this._temperature);
        });
    }

    // Mengubah suhu dan memberi notifikasi ke observer
    setTemperature(temperature) {
        console.log(`\nWeatherStation: Suhu berubah menjadi ${temperature}°C`);
        this._temperature = temperature;
        this.notifyObservers();
    }
}

// Interface Observer - Menampilkan suhu di layar ponsel
class PhoneDisplay {
    update(temperature) {
        console.log(`PhoneDisplay: Menampilkan suhu ${temperature}°C`);
    }
}

// Interface Observer - Menampilkan suhu di web
class WebDisplay {
    update(temperature) {
        console.log(`WebDisplay: Update suhu ke ${temperature}°C`);
    }
}

// Client Code
const weatherStation = new WeatherStation();

const phoneDisplay = new PhoneDisplay();
const webDisplay = new WebDisplay();

// Registrasi observer
weatherStation.attach(phoneDisplay);
weatherStation.attach(webDisplay);

// Simulasi perubahan suhu
weatherStation.setTemperature(25);
weatherStation.setTemperature(30);

// Menghapus observer PhoneDisplay
weatherStation.detach(phoneDisplay);

// Simulasi perubahan suhu berikutnya
weatherStation.setTemperature(34);
```
#### Output
![image](https://github.com/user-attachments/assets/e57070e0-5988-43c0-8445-fa47d921bbec)

#### Penjelasan
Program di atas merupakan implementasi pola desain Observer dalam JavaScript, yang digunakan untuk memantau perubahan suhu pada suatu WeatherStation. Kelas WeatherStation bertindak sebagai subject yang menyimpan data suhu dan daftar observer. Ia menyediakan metode attach untuk menambahkan observer, detach untuk menghapusnya, dan setTemperature untuk mengubah suhu serta memberi notifikasi ke semua observer melalui metode notifyObservers. Dua kelas observer, yaitu PhoneDisplay dan WebDisplay, masing-masing memiliki metode update yang akan dipanggil ketika suhu berubah. Dalam kode klien, dua observer didaftarkan ke WeatherStation, lalu suhu diubah beberapa kali untuk menunjukkan bagaimana observer merespons perubahan. Program ini menunjukkan bagaimana sistem dapat diperluas dan dimodifikasi tanpa mengubah kelas inti subject, sesuai prinsip desain perangkat lunak yang baik.
