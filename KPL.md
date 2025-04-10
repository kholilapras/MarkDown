<h1>Konsruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal 6</h3>

## sayaTubeVideo.js
#### Source Code
```js
class SayaTubeVideo {
    constructor(title) {
      if (!title || typeof title !== "string" || title.length > 200) {
        throw new Error("Judul video harus berupa string dan maksimal 200 karakter.");
      }
      this.id = Math.floor(10000 + Math.random() * 90000);
      this.title = title;
      this.playCount = 0;
    }
  
    increasePlayCount(count) {
      try {
        if (typeof count !== "number" || count < 0 || count > 25000000) {
          throw new Error("Input play count harus antara 0 sampai 25.000.000");
        }
  
        const newCount = this.playCount + count;
        if (newCount > Number.MAX_SAFE_INTEGER) {
          throw new Error("Terjadi overflow pada play count.");
        }
  
        this.playCount = newCount;
      } catch (err) {
        console.error(`[ERROR] ${err.message}`);
      }
    }
  
    printVideoDetails() {
      console.log(`ID: ${this.id}`);
      console.log(`Title: ${this.title}`);
      console.log(`Play Count: ${this.playCount}`);
    }
  }
  
  module.exports = SayaTubeVideo;
```

## sayaTubeUser.js
#### Source Code
```js
const SayaTubeVideo = require("./SayaTubeVideo");

class SayaTubeUser {
  constructor(username) {
    if (!username || typeof username !== "string" || username.length > 100) {
      throw new Error("Username harus berupa string dan maksimal 100 karakter.");
    }
    this.username = username;
    this.uploadedVideos = [];
  }

  addVideo(video) {
    if (!(video instanceof SayaTubeVideo)) {
      throw new Error("Video harus instance dari SayaTubeVideo.");
    }
    if (video.playCount >= Number.MAX_SAFE_INTEGER) {
      throw new Error("Video tidak boleh memiliki play count yang mendekati batas maksimum integer.");
    }
    this.uploadedVideos.push(video);
  }

  getTotalVideoPlayCount() {
    return this.uploadedVideos.reduce((total, video) => total + video.playCount, 0);
  }

  printAllVideoPlaycount() {
    console.log(`User: ${this.username}`);
    const maxVideos = Math.min(this.uploadedVideos.length, 8);
    for (let i = 0; i < maxVideos; i++) {
      console.log(`Video ${i + 1} judul: ${this.uploadedVideos[i].title}`);
    }
  }
}

module.exports = SayaTubeUser;
```

## index.js
#### Source Code
```js
const SayaTubeVideo = require("./SayaTubeVideo");
const SayaTubeUser = require("./SayaTubeUser");

const user = new SayaTubeUser("Kholil");

const judulFilm = [
  "Review Film Home Alone oleh Kholil",
  "Review Film Home Alone 2: Lost in New York oleh Kholil",
  "Review Film Home Alone 3 oleh Kholil",
  "Review Film Home Alone 4: Taking Back the House oleh Kholil",
  "Review Film Home Alone: The Holiday Heist oleh Kholil",
  "Review Film Home Sweet Home Alone oleh Kholil",
  "Review Film The Making of Home Alone oleh Kholil",
  "Review Film Behind the Scenes Home Alone oleh Kholil",
  "Review Film Home Alone Reboot oleh Kholil",
  "Review Film Home Alone Christmas Edition oleh Kholil"
];

judulFilm.forEach(judul => {
  const video = new SayaTubeVideo(judul);
  video.increasePlayCount(1000000);
  user.addVideo(video);
});

user.printAllVideoPlaycount();
console.log(`Total Play Count: ${user.getTotalVideoPlayCount()}`);
```

#### Output
![image](https://github.com/user-attachments/assets/7cfbc6a2-f248-4c8d-9539-440a3d7d6061)

#### Penjelasan
Program ini merupakan dari studi kasus pembuatan dua kelas objek yaitu SayaTubeVideo dan SayaTubeUser, yang dirancang untuk merepresentasikan pengguna dan video dalam sebuah sistem sederhana seperti YouTube. Kelas SayaTubeVideo memiliki atribut seperti id, title, dan playCount, di mana id di-generate secara acak 5 digit saat objek dibuat, title menyimpan judul video, dan playCount menyimpan jumlah penayangan. Terdapat method increasePlayCount() yang menambahkan nilai tayangan dengan syarat tidak melebihi 25 juta dalam satu pemanggilan, serta mencegah overflow integer. Method printVideoDetails() digunakan untuk mencetak detail video.

Sementara itu, kelas SayaTubeUser merepresentasikan pengguna dengan atribut username dan daftar video yang diunggah (uploadedVideos). Konstruktor memvalidasi agar nama pengguna tidak null dan tidak melebihi 100 karakter. Method addVideo() menambahkan video ke daftar unggahan dengan memastikan bahwa objek yang ditambahkan valid dan tidak menyebabkan play count overflow. Method getTotalVideoPlayCount() mengembalikan total tayangan dari semua video yang diunggah oleh pengguna, dan printAllVideoPlaycount() mencetak maksimal 8 judul video milik pengguna dengan format yang telah ditentukan.

Di dalam file index.js, objek SayaTubeUser dibuat dengan nama “Kholil”, lalu ditambahkan 10 video bertema film Home Alone dengan format judul seperti “Review Film Home Alone oleh Kholil”. Setiap video disimulasikan memiliki play count sebesar 1 juta. Kemudian, program mencetak daftar video yang dimiliki oleh pengguna serta total play count-nya. Seluruh logika program telah mengikuti prinsip design by contract, yaitu dengan validasi precondition (seperti validasi input dan batasan panjang data), exception handling (menghindari error fatal saat program berjalan), serta postcondition (membatasi output maksimal 8 video saat ditampilkan).
