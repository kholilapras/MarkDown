<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Pertemuan 9</h3>

<br>

## IMPLEMENTASI WEB API
#### Link Google Colab
```
https://colab.research.google.com/drive/1EYLLzJZGwF3j3QOR6ZktawxRNcARoUZo?usp=sharing
```

#### Source Code 
```py
# Install library
!pip install fastapi uvicorn nest-asyncio pyngrok

# Import library
from fastapi import FastAPI
from pydantic import BaseModel
from typing import List
import uvicorn
import nest_asyncio
from pyngrok import ngrok, conf

# Konfigurasi Ngrok Token
conf.get_default().auth_token = "2wD8F9KscwFYNHHJ0CWg5JAe040_34X6Mpo7btB4ZR9NLtqPf"

# Inisialisasi FastAPI
app = FastAPI()

# Model Mahasiswa
class Mahasiswa(BaseModel):
    name: str
    nim: str
    course: List[str]
    year: int

# List Data
mahasiswa_list = [
    {"name": "Jay Idzes", "nim": "20250001", "course": ["AI", "Web Dev"], "year": 2022},
    {"name": "Thom Haye", "nim": "20250002", "course": ["ML", "Database"], "year": 2021},
    {"name": "Ole Romeny", "nim": "20250003", "course": ["IoT", "CyberSec"], "year": 2023}
]

# GET semua Mahasiswa
@app.get("/api/Mahasiswa")
def get_all_mahasiswa():
    return mahasiswa_list

# GET Mahasiswa berdasarkan index
@app.get("/api/Mahasiswa/{id}")
def get_mahasiswa(id: int):
    if 0 <= id < len(mahasiswa_list):
        return mahasiswa_list[id]
    return {"error": "Index tidak ditemukan"}

# POST tambah Mahasiswa
@app.post("/api/Mahasiswa")
def tambah_mahasiswa(mhs: Mahasiswa):
    mahasiswa_list.append(mhs.dict())
    return {"pesan": "Mahasiswa berhasil ditambahkan", "data": mhs.dict()}

# DELETE Mahasiswa berdasarkan index
@app.delete("/api/Mahasiswa/{id}")
def hapus_mahasiswa(id: int):
    if 0 <= id < len(mahasiswa_list):
        deleted = mahasiswa_list.pop(id)
        return {"pesan": "Mahasiswa dihapus", "data": deleted}
    return {"error": "Index tidak ditemukan"}

# Jalankan server ngrok
nest_asyncio.apply()
public_url = ngrok.connect(8000)
print("🔗 Public URL (Swagger UI):", public_url.public_url + "/docs")

uvicorn.run(app, port=8000)
```

#### Cara Penggunaan
1.) Buka Link Google Colab diatas lalu dan run program tugas jurnal
![image](https://github.com/user-attachments/assets/01b049cc-eb08-43cd-9850-4a6fca8039a5)

2.) Klik Link yang terdapat pada Public URL (Swagger UI):
![image](https://github.com/user-attachments/assets/f2000683-00ec-45d6-a978-7152c79d8c64)

3.) Klik visit site
![image](https://github.com/user-attachments/assets/60478f44-6739-4d38-a0e4-152e8bc509a7)
![image](https://github.com/user-attachments/assets/86a7e921-4a35-483f-939d-433f012a504e)

<br>

## MENDEMONSTRASI WEB API
#### A. Mencoba GET /api/mahasiswa
![image](https://github.com/user-attachments/assets/4f8a610d-f6c0-4866-9e89-de9c9c3ea637)

#### B. Tambahkan satu data Mahasiswa baru (urutan ke-4 dalam list) dengan menggunakan endpoint POST /api/Mahasiswa
![image](https://github.com/user-attachments/assets/941333a2-d33a-41b6-bf82-ff48eae215a0)

#### C. lakukan kembali GET /api/Mahasiswa untuk memastikan bahwa data Mahasiswa yang baru berhasil ditambahkan ke dalam list.
![image](https://github.com/user-attachments/assets/fdd9902b-d77e-4d61-9856-4e38b5f7edeb)

#### D. Lakukan permintaan GET ke endpoint /api/Mahasiswa/3 untuk mengambil data Mahasiswa yang baru saja ditambahkan (yang ada di index ke-3).
![image](https://github.com/user-attachments/assets/20ea8d5f-bfe8-4d1e-a2b4-68f32a820f07)

#### E. Hapus data Mahasiswa yang berada pada index ke-3 dengan menggunakan endpoint DELETE
![image](https://github.com/user-attachments/assets/f090eb2e-c672-416a-9a70-723cf934dacc)

#### F. Lakukan satu kali lagi GET /api/Mahasiswa untuk memastikan bahwa Mahasiswa pada index ke-3 sebelumnya sudah tidak ada di list.
![image](https://github.com/user-attachments/assets/eb93d371-32f7-4aab-90f9-200bba9031b4)

#### Penjelasan
Program di atas merupakan aplikasi web sederhana berbasis FastAPI yang digunakan untuk mengelola data mahasiswa. Program diawali dengan menginstal dan mengimpor beberapa library penting seperti fastapi, uvicorn, nest_asyncio, dan pyngrok. Selanjutnya, token autentikasi Ngrok dikonfigurasi untuk membuat server lokal dapat diakses secara publik melalui internet. FastAPI diinisialisasi, lalu dibuat model data Mahasiswa menggunakan BaseModel dari Pydantic, yang mencakup atribut nama, NIM, daftar mata kuliah, dan tahun angkatan. Data mahasiswa disimpan dalam sebuah list Python. Aplikasi menyediakan beberapa endpoint REST API: GET /api/Mahasiswa untuk mengambil seluruh data mahasiswa, GET /api/Mahasiswa/{id} untuk mengambil data berdasarkan indeks, POST /api/Mahasiswa untuk menambahkan data baru, dan DELETE /api/Mahasiswa/{id} untuk menghapus data berdasarkan indeks.
