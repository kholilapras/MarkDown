<h1>Konsruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Modul 7</h3>

## JSON DESERIALIZATON 1
#### jurnal7_1_2211104071.json 
```js
{
    "firstName": "Kholil Abdi",
    "lastName": "Prasetiyo",
    "gender": "male",
    "age": 20,
    "address": {
        "streetAddress": "Jl. Gumelar",
        "city": "Banyumas",
        "state": "Central Java"
    },
    "courses": [
        {
            "code": "CCK2DAB3",
            "name": "Proses Perangkat Lunak"
        },
        {
            "code": "CCK2LAB3",
            "name": "Kecerdasan Buatan"
        }
    ]
}
```
#### DataMahasiswa2211104071.js
```js  
const fs = require('fs');
const path = require('path');

function ReadJSON() {
    const filePath = path.join(__dirname, 'jurnal7_1_2211104071.json');

    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error('Gagal membaca file JSON:', err);
            return;
        }

        try {
            const mhs = JSON.parse(data);

            console.log('===== DATA MAHASISWA =====');
            console.log('Nama Lengkap     :', mhs.firstName, mhs.lastName);
            console.log('Jenis Kelamin    :', mhs.gender);
            console.log('Umur             :', mhs.age);
            console.log('Alamat:');
            console.log('  Jalan          :', mhs.address.streetAddress);
            console.log('  Kota           :', mhs.address.city);
            console.log('  Provinsi       :', mhs.address.state);
            console.log('Mata Kuliah:');
            mhs.courses.forEach((course, index) => {
                console.log(`  ${index + 1}. [${course.code}] ${course.name}`);
            });
        } catch (parseErr) {
            console.error('Gagal parsing JSON:', parseErr.message);
        }
    });
}

ReadJSON();
```

#### Output
![image](https://github.com/user-attachments/assets/ef4ed664-36b1-456c-a16b-f6f09bf0d65e)

#### Penjelasan
Program JavaScript di atas melakukan deserialisasi data JSON dari file bernama jurnal7_1_2211104071.json menggunakan modul fs (File System) dan path dari Node.js. Fungsi ReadJSON membaca file JSON tersebut secara asinkron dengan fs.readFile, lalu mengubah isi file (yang berupa string JSON) menjadi objek JavaScript menggunakan JSON.parse. Setelah berhasil diparse, program menampilkan informasi data mahasiswa ke konsol, termasuk nama lengkap, jenis kelamin, umur, alamat lengkap (jalan, kota, dan provinsi), serta daftar mata kuliah yang diambil, dengan menampilkan kode dan nama mata kuliah. Jika terjadi kesalahan saat membaca atau mem-parsing file, pesan error akan ditampilkan. Program ini mendemonstrasikan proses dasar pengolahan file dan parsing JSON di Node.js.

<br>

## JSON DESERIALIZATON 2
#### jurnal7_2_2211104071.json 
```js
{
    "members": [
        {
            "firstName": "Thom",
            "lastName": "Haye",
            "gender": "male",
            "age": 28,
            "nim": "7349282382"
        },
        {
            "firstName": "Jay",
            "lastName": "Idzes",
            "gender": "male",
            "age": 32,
            "nim": "5678568567"
        },
        {
            "firstName": "Hokky",
            "lastName": "Caraka",
            "gender": "female",
            "age": 24,
            "nim": "456754675"
        }
    ]
}
```
#### TeamMembers2211104071.js
```js  
const fs = require('fs');
const path = require('path');

function ReadJSON() {
    const filePath = path.join(__dirname, 'jurnal7_2_2211104071.json');

    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error('Gagal membaca file JSON:', err);
            return;
        }

        try {
            const obj = JSON.parse(data);
            const members = obj.members;

            console.log('Team member list:');
            members.forEach(member => {
                const fullName = `${member.firstName} ${member.lastName}`;
                console.log(`${member.nim} ${fullName} (${member.age} ${member.gender})`);
            });

        } catch (parseErr) {
            console.error('Gagal parsing JSON:', parseErr.message);
        }
    });
}

ReadJSON();
```

#### Output
![image](https://github.com/user-attachments/assets/ef21a367-cacb-4135-bbaf-8fdf3154b897)

#### Penjelasan
Program JavaScript di atas berfungsi untuk melakukan deserialisasi data JSON dari file jurnal7_2_2211104071.json, yang berisi daftar anggota tim. Dengan menggunakan modul fs dan path dari Node.js, fungsi ReadJSON membaca file tersebut secara asinkron. Setelah isi file berhasil dibaca, data dalam bentuk string JSON diubah menjadi objek JavaScript menggunakan JSON.parse. Objek yang dihasilkan memiliki properti members, yaitu array yang berisi data tiap anggota tim. Program kemudian melakukan iterasi pada array tersebut dan mencetak informasi setiap anggota ke konsol, termasuk NIM, nama lengkap, usia, dan jenis kelamin. Jika terjadi kesalahan saat membaca atau parsing file, pesan error akan ditampilkan. Program ini merupakan contoh penggunaan dasar JSON parsing dan manipulasi data array di Node.js.

<br>

## JSON DESERIALIZATON 3
#### jurnal7_3_2211104071.json 
```js
{
    "glossary": {
        "title": "example glossary",
		"GlossDiv": {
            "title": "S",
			"GlossList": {
                "GlossEntry": {
                    "ID": "SGML",
					"SortAs": "SGML",
					"GlossTerm": "Standard Generalized Markup Language",
					"Acronym": "SGML",
					"Abbrev": "ISO 8879:1986",
					"GlossDef": {
                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
						"GlossSeeAlso": ["GML", "XML"]
                    },
					"GlossSee": "markup"
                }
            }
        }
    }
}
```
#### GlossaryItem2211104071.js
```js  
const fs = require('fs');
const path = require('path');

function ReadJSON() {
    const filePath = path.join(__dirname, 'jurnal7_3_2211104071.json');

    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error('Gagal membaca file JSON:', err);
            return;
        }

        try {
            const obj = JSON.parse(data);
            const entry = obj.glossary.GlossDiv.GlossList.GlossEntry;

            console.log('===== GlossEntry Data =====');
            console.log('ID           :', entry.ID);
            console.log('SortAs       :', entry.SortAs);
            console.log('GlossTerm    :', entry.GlossTerm);
            console.log('Acronym      :', entry.Acronym);
            console.log('Abbrev       :', entry.Abbrev);
            console.log('Definition   :', entry.GlossDef.para);
            console.log('See Also     :', entry.GlossDef.GlossSeeAlso.join(', '));
            console.log('Gloss See    :', entry.GlossSee);

        } catch (parseErr) {
            console.error('Gagal parsing JSON:', parseErr.message);
        }
    });
}

ReadJSON();
```

#### Output
![image](https://github.com/user-attachments/assets/689bfe6c-eaba-4ab0-9ccf-b31740a6f1b5)

#### Penjelasan
Program JavaScript ini melakukan deserialisasi file JSON bernama jurnal7_3_2211104071.json, yang berisi struktur data bertingkat mengenai sebuah entri glosarium. Dengan menggunakan modul fs dan path dari Node.js, fungsi ReadJSON membaca file JSON secara asinkron. Setelah file berhasil dibaca, data dalam format string diubah menjadi objek JavaScript menggunakan JSON.parse. Program kemudian menavigasi struktur objek yang cukup dalam—mulai dari glossary, GlossDiv, GlossList, hingga GlossEntry. Dari objek GlossEntry, program mengambil dan menampilkan berbagai informasi seperti ID, nama singkatan (acronym), istilah glosarium, definisi, daftar istilah terkait (GlossSeeAlso), dan referensi (GlossSee). Informasi ini kemudian ditampilkan ke konsol dalam format yang terstruktur. Program ini menunjukkan bagaimana membaca dan mengakses data bersarang (nested) dalam file JSON menggunakan Node.js.
