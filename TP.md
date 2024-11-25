<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 11**  
**DATA STORAGE BAGIAN 2**

<img src="https://github.com/user-attachments/assets/8ffbc3d9-1f18-4a72-8723-692ba5757f0c" alt="Logo_Telkom_University" width="25%">

**Disusun Oleh**:  
Kholil Abdi Prasetiyo / 2211104071  
SISE-06-02

**Asisten Praktikum**:  
Muhammad Faza Zulian Gesit Al Barru  
Aisyah Hasna Aulia

**Dosen Pengampu**:  
Yudha Islami Sulistya, S.Kom., M.Cs

**PROGRAM STUDI S1 SOFTWARE ENGINEERING**  
**FAKULTAS INFORMATIKA**  
**TELKOM UNIVERSITY PURWOKERTO**  
**2024**
</div>

---
<div align="center">
  
**TUGAS PENDAHULUAN**  
  
</div>

## 1. Firebase dan Fitur Utamanya  
a. Jelaskan apa yang dimaksud dengan Firebase.  
Firebase adalah platform pengembangan aplikasi berbasis cloud yang dimiliki oleh Google. Firebase menyediakan serangkaian alat dan layanan yang membantu pengembang membangun, mengelola, dan mengoptimalkan aplikasi web maupun seluler dengan cepat dan efisien. Platform ini mendukung pengembangan backend tanpa memerlukan pengelolaan server, sehingga pengembang dapat lebih fokus pada pengalaman pengguna.  

b. Sebutkan tiga fitur utama Firebase beserta fungsinya masing-masing  
1. Firebase Realtime Database : Menyediakan database berbasis cloud yang menyimpan dan menyinkronkan data secara real-time di seluruh pengguna aplikasi. Cocok untuk aplikasi yang membutuhkan pembaruan data secara langsung, seperti aplikasi obrolan atau pelacakan lokasi.  
2. Firebase Authentication : Menyediakan sistem otentikasi yang sederhana dan aman. Mendukung berbagai metode login, seperti email, Google, Facebook, atau nomor telepon, sehingga memudahkan pengembang mengelola autentikasi pengguna.  
3. Firebase Cloud Messaging (FCM) : Memungkinkan pengiriman notifikasi push gratis ke perangkat pengguna. Berguna untuk meningkatkan keterlibatan pengguna dengan mengirimkan pemberitahuan tentang pembaruan, promosi, atau pengingat.

## 2. Notification Message vs. Data Message  
Jelaskan perbedaan antara Notification Message dan Data Message pada Firebase Cloud Messaging. Berikan contoh penggunaan untuk masing-masing jenis pesan. 

- Perbedaan Utama: Notification Message untuk pemberitahuan langsung, sedangkan Data Message untuk logika atau pemrosesan lebih lanjut oleh aplikasi.


- Notification Message: Pesan ini digunakan untuk menampilkan notifikasi langsung di tray perangkat. Payload berisi kunci notification yang diinterpretasikan oleh FCM SDK untuk membuat dan menampilkan notifikasi tanpa intervensi aplikasi. Pesan ini diproses di tingkat sistem jika aplikasi tidak aktif (background/killed).

```json
{
  "to": "device_token",
  "notification": {
    "title": "Promo 12.12 !",
    "body": "Diskon hingga 90% untuk pengguna baru.",
    "icon": "promo.png"
  }
}
```

- Data Message: Pesan ini mengandung kunci data dengan payload berupa pasangan key-value. Pesan ini diteruskan langsung ke aplikasi untuk diproses, memungkinkan penerapan logika khusus (seperti sinkronisasi data atau menampilkan notifikasi secara manual). Data Message selalu diterima oleh aplikasi, baik di foreground maupun background, jika perangkat online.
```json
{
  "to": "device_token",
  "data": {
    "order_id": "1234",
    "status": "delivered",
    "timestamp": "2024-12-25T12:00:00Z"
  }
}
```

## 3. FCM Token  
Apa yang dimaksud dengan Firebase Cloud Messaging (FCM) Token, dan mengapa token ini penting untuk mengirim notifikasi ke aplikasi?  
Firebase Cloud Messaging (FCM) Token adalah identitas unik yang dihasilkan oleh Firebase untuk setiap perangkat atau instans aplikasi yang terhubung dengan layanan Firebase Cloud Messaging. Token ini digunakan untuk mengidentifikasi perangkat secara spesifik agar server Firebase dapat mengirimkan pesan atau notifikasi ke perangkat tersebut.
Mengapa FCM Token Penting?  
1. Identifikasi Perangkat : FCM Token bertindak sebagai identifier unik untuk perangkat atau pengguna aplikasi. Dengan token ini, server dapat memastikan bahwa pesan dikirim ke perangkat atau instans aplikasi yang tepat.
2. Pengiriman Notifikasi yang Ditargetkan : Dengan FCM Token, Anda dapat mengirim notifikasi yang disesuaikan, misalnya: Hanya untuk perangkat tertentu & Berdasarkan preferensi pengguna.
3. Manajemen Skala Besar : Untuk aplikasi dengan jutaan pengguna, token memungkinkan pengiriman pesan secara terorganisir, baik untuk satu perangkat (unicast) maupun kelompok perangkat (multicast atau topic-based messaging).

## 4. Penanganan Notifikasi oleh FCM  
Jelaskan bagaimana Firebase Cloud Messaging menangani notifikasi dalam kondisi aplikasi berikut:  
a. Saat aplikasi berada di foreground.  
1. Notifikasi tidak secara otomatis ditampilkan di tray perangkat karena aplikasi dianggap sedang berjalan aktif.
2. Developer akan menerima payload notifikasi di callback onMessageReceived() dalam service FirebaseMessagingService.
3. Developer dapat memproses payload dan menentukan tindakan: Menampilkan notifikasi manual menggunakan NotificationManager. Melakukan operasi lain, seperti memperbarui UI atau memproses data yang diterima.

b. Saat aplikasi berada di background.  
1. Notifikasi otomatis ditampilkan di tray perangkat jika pesan dikirim dengan payload notification. FCM menangani rendering notifikasi ini tanpa intervensi developer.
2. Jika pesan memiliki payload data saja (tanpa notification):
   - Data tidak langsung diterima oleh aplikasi.
   - Notifikasi tidak otomatis ditampilkan.
   - Data diteruskan ke aplikasi hanya jika pengguna mengetuk notifikasi untuk membuka aplikasi.

c. Saat aplikasi dalam kondisi terminated.  
1. Notifikasi dengan payload notification akan ditampilkan otomatis di tray perangkat oleh FCM, tanpa melibatkan aplikasi.
2. Jika pesan hanya memiliki payload data:
   - Data tidak diteruskan ke aplikasi hingga pengguna membuka aplikasi.
   - Aplikasi dapat menerima data ini di getIntent() atau parameter lainnya saat dibuka kembali (bergantung pada konfigurasi).
3. Developer perlu mengonfigurasi "click_action" atau intent eksplisit untuk memastikan data diteruskan dengan benar saat aplikasi dibuka dari notifikasi.
