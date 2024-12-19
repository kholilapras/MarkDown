<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 14**  
**DATA STORAGE BAGIAN 3**


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
# A. REST API
REST API (Representational State Transfer Application Programming Interface) adalah antarmuka yang memungkinkan aplikasi klien untuk berinteraksi dengan database melalui protokol HTTP. REST API menyediakan cara untuk membaca, menambahkan, memperbarui, dan menghapus data dari database tanpa harus mengakses database langsung.Mendapatkan token unik dari setiap perangkat pengguna.
Kegunaan REST API :  
1. Interoperabilitas: REST API memungkinkan aplikasi berbasis web dan mobile untuk mengakses data yang sama.  
2. Efisiensi: Data yang dikirimkan biasanya ringan (format JSON atau XML), membuatnya cepat untuk dikirim dan diterima.  
3. Keamanan: API bisa membatasi akses menggunakan token autentikasi.

## B. HTTP
HTTP (Hypertext Transfer Protocol) adalah protokol komunikasi utama yang digunakan untuk mengirimkan data antara klien (misalnya browser atau aplikasi) dan server.
- Metode HTTP Utama :  
1. GET: Mengambil data dari server.  
2. POST: Mengirim data baru ke server.  
3. PUT/PATCH: Memperbarui data yang ada di server.  
4. DELETE: Menghapus data dari server.  
- Komponen HTTP Request  
1. URL: Alamat yang menunjukkan resource tertentu.  
2. Method: Operasi yang akan dilakukan (GET, POST, dll.).  
3. Headers: Informasi tambahan seperti format data atau token autentikasi.  
4. Body: Data yang dikirimkan (digunakan dalam POST/PUT).  
- Komponen HTTP Response  
1. Status Code: Menunjukkan hasil operasi (misalnya, 200 untuk berhasil, 404 untuk resource
tidak ditemukan).  
2. Headers: Informasi tambahan dari server.  
3. Body: Data yang dikembalikan server (biasanya dalam format JSON)  
## C. PRAKTIKUM

#### Menambahkan Package
![image](https://github.com/user-attachments/assets/5e46b504-36d7-419b-893c-692932748965)

#### Stuktur Folder
![image](https://github.com/user-attachments/assets/54bfb218-e5c6-4f4f-a118-63e4d39a614a)

#### Source Code
- lib/screens/homepage_screen.dart
```dart
import 'package:prak14_ppb/services/api_service.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List<dynamic> _posts = []; // Menyimpan list posts
  bool _isLoading = false; // Untuk indikator loading
  final ApiService _apiService = ApiService(); // Instance ApiService
  // Fungsi untuk menampilkan SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Fungsi untuk memanggil API dan menangani operasi
  Future<void> _handleApiOperation(
      Future<void> operation, String successMessage) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await operation; // Menjalankan operasi API
      setState(() {
        _posts = _apiService.posts;
      });
      _showSnackBar(successMessage);
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API-Praktikum 14'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _posts.isEmpty
                    ? const Text(
                        "Tekan tombol GET untuk mengambil data",
                        style: TextStyle(fontSize: 12),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _posts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Card(
                                elevation: 4,
                                child: ListTile(
                                  title: Text(
                                    _posts[index]['title'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  subtitle: Text(
                                    _posts[index]['body'],
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.fetchPosts(), 'Data berhasil diambil!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('GET'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.createPost(), 'Data berhasil ditambahkan!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('POST'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.updatePost(), 'Data berhasil diperbarui!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('UPDATE'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.deletePost(), 'Data berhasil dihapus!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('DELETE'),
            ),
          ],
        ),
      ),
    );
  }
}
```

- lib/services/api_service.dart
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  List<dynamic> posts = []; // Menyimpan data post yang diterima

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      posts = json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST.',
        'userId': 1,
      }),
    );
    if (response.statusCode == 201) {
      posts.add({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST.',
        'id': posts.length + 1,
      });
    } else {
      throw Exception('Failed to create post');
    }
  }

// Fungsi untuk UPDATE data
  Future<void> updatePost() async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/1'),
      body: json.encode({
        'title': 'Updated Title',
        'body': 'Updated Body',
        'userId': 1,
      }),
    );
    if (response.statusCode == 200) {
      final updatedPost = posts.firstWhere((post) => post['id'] == 1);
      updatedPost['title'] = 'Updated Title';
      updatedPost['body'] = 'Updated Body';
    } else {
      throw Exception('Failed to update post');
    }
  }

// Fungsi untuk DELETE data
  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/1'),
    );
    if (response.statusCode == 200) {
      posts.removeWhere((post) => post['id'] == 1);
    } else {
      throw Exception('Failed to delete post');
    }
  }
}

```

- lib/main.dart
```dart
import 'package:prak14_ppb/screens/homepage_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomepageScreen(),
    );
  }
}
```

#### Output

#### Deskripsi
#### homepage_screen.dart
A. State Management:  
- _posts: List untuk menyimpan data yang diambil dari API.
- _isLoading: Indikator untuk menunjukkan apakah proses API sedang berjalan.
- _apiService: Instansiasi kelas ApiService untuk memanggil fungsi-fungsi API.

B. Snackbar Utility:  
_showSnackBar(String message): Menampilkan pesan singkat menggunakan SnackBar.

C. Fungsi Penanganan API:  
_handleApiOperation(Future<void> operation, String successMessage): Fungsi yang menjalankan operasi API dengan:
- Menampilkan indikator loading.
- Menangkap hasil operasi dan memperbarui data.
- Menangani kesalahan jika terjadi.
- Menonaktifkan indikator loading.

D. Tampilan UI:  
Tombol API
- GET: Memanggil fetchPosts() untuk mengambil data dari API.
- POST: Memanggil createPost() untuk menambahkan data ke API.
- UPDATE: Memanggil updatePost() untuk memperbarui data di API.
- DELETE: Memanggil deletePost() untuk menghapus data di API.

E. Penggunaan ElevatedButton:  
- Oranye untuk GET.
- Hijau untuk POST.
- Biru untuk UPDATE.
- Merah untuk DELETE.
- Setiap tombol memanggil _handleApiOperation dengan operasi API terkait.

#### api_service.dart
A. Class ApiService: Bertugas untuk berinteraksi dengan API menggunakan metode HTTP.
B. Atribut :
- baseUrl: URL dasar API (https://jsonplaceholder.typicode.com).
- posts: List untuk menyimpan data post yang diterima dari API.
C. Fungsi-Fungsi:
- fetchPosts():
  - Melakukan permintaan GET ke API untuk mengambil semua data post.
  - Data hasil fetch disimpan dalam atribut posts.
  - Jika gagal, melempar exception.
- createPost():
  - Melakukan permintaan POST untuk membuat post baru.
  - Data yang dikirim berupa JSON (judul, isi, dan userId).
  - Jika berhasil, data post baru ditambahkan ke list posts
- updatePost() :
  - Melakukan permintaan PUT untuk memperbarui post dengan ID tertentu (default ID 1).
  - Mengubah data di server dan memperbarui data di list posts jika berhasil.
- deletePost():
  - Melakukan permintaan DELETE untuk menghapus post dengan ID tertentu (default ID 1).
  - Menghapus data dari server dan list posts jika berhasil.
D. Error Handling:
- Setiap fungsi memiliki pengecekan status HTTP:
  - Status berhasil (200 atau 201) diproses.
  - Status gagal melempar exception dengan pesan error.
E. Penerapan Headers: Header Content-Type: application/json digunakan untuk POST dan PUT, memastikan data dikirim dalam format JSON.

# UNGUIDED

## Tugas Mandiri


#### Konfigurasi
Tambahkan Package GetX  

Struktur Folder  

#### Source Code


- lib/main.dart
```dart
}
```

#### Output

#### Deskripsi
