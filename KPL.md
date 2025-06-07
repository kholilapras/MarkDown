<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Pendahuluan Pertemuan 13</h3>

<br>

# MENJELASKAN SALAH SATU DESIGN PATTERN
Buka halaman web https://refactoring.guru/design-patterns/catalog kemudian baca design pattern
dengan nama “Observer”, dan jawab pertanyaan berikut ini (dalam Bahasa Indonesia):

## A.) Berikan salah satu contoh kondisi dimana design pattern “Observer” dapat digunakan
Observer pattern dapat digunakan dalam aplikasi berita atau cuaca di mana banyak komponen (observer) perlu mendapatkan pembaruan saat data pusat (subject) berubah. Misalnya, ketika ada perubahan data cuaca (seperti suhu, kelembapan), maka berbagai tampilan UI atau modul notifikasi dapat secara otomatis memperbarui diri tanpa saling bergantung langsung satu sama lain.

## B.) Berikan penjelasan singkat mengenai langkah-langkah dalam mengimplementasikan design pattern “Observer”
1. Buat Interface/Abstract untuk Observer
   : Mendefinisikan metode yang harus dimiliki semua observer, biasanya bernama update().
2. Buat Interface/Abstract untuk Subject
   : Mendefinisikan metode untuk:
   - Menambahkan observer (attach(observer))
   - Menghapus observer (detach(observer))
   - Memberi tahu observer (notify())
3. Implementasi Subject Konkret
   - Menyimpan daftar observer.
   - Mengubah state internalnya.
   - Memanggil notify() saat terjadi perubahan.
4. Implementasi Observer Konkret
   : Mengimplementasikan method update(), berisi cara menangani perubahan dari subject.
5. Integrasikan Observer ke Subject
   - Observer didaftarkan ke subject.
   - Saat subject berubah, semua observer akan menerima notifikasi dan bereaksi sesuai logikanya.

## C.) Berikan kelebihan dan kekurangan dari design pattern “Observer”
1. Kelebihan:
   - Loose coupling (Keterkaitan rendah): Subject tidak perlu tahu detail dari observer, hanya bahwa mereka mengikuti kontrak interface tertentu.
   - Fleksibilitas Tinggi: Mudah menambah atau menghapus observer tanpa mengubah subject.
   - Sinkronisasi Otomatis: Semua observer dapat diperbarui secara otomatis ketika subject berubah.
2. Kekurangan:
   - Potensi Masalah Kinerja: Terlalu banyak observer bisa menyebabkan beban besar saat notifikasi dikirim.
   - Kesulitan Debugging: Aliran data bisa kompleks karena notifikasi menyebar ke banyak komponen, menyulitkan pelacakan bug.
   - Ketergantungan Tidak Terlihat: Observer tergantung pada subject, tapi hubungan ini tidak selalu jelas saat membaca kode.

<br>

## IMPLEMENTASI DAN PEMAHAMAN DESIGN PATTERN OBSERVER
Buka halaman web berikut https://refactoring.guru/design-patterns/observer dan scroll ke bagian “Code
Examples”, pilih kode yang akan dilihat dan ikuti langkah-langkah berikut:

#### A.) Pada project yang telah dibuat sebelumnya, tambahkan kode yang mirip atau sama dengan contoh
kode yang diberikan di halaman web tersebut

#### B.) Jalankan program tersebut dan pastikan tidak ada error pada saat project dijalankan

#### C.) Jelaskan tiap baris kode yang terdapat di bagian method utama atau “main”
