<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Pendahuluan Pertemuan 9</h3>

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
import uvicorn
import nest_asyncio
from pyngrok import ngrok, conf

# Konfigurasi Ngrok Token
conf.get_default().auth_token = "2wD8F9KscwFYNHHJ0CWg5JAe040_34X6Mpo7btB4ZR9NLtqPf"

# Inisialisasi FastAPI
app = FastAPI()

# Model Mahasiswa
class Mahasiswa(BaseModel):
    nama: str
    nim: str

# Database sementara (static)
mahasiswa_list = [
    {"nama": "Jay Idzes", "nim": "20250001"},
    {"nama": "Thom Haye", "nim": "20250002"}
]

# GET semua mahasiswa
@app.get("/api/mahasiswa")
def get_all_mahasiswa():
    return mahasiswa_list

# GET mahasiswa berdasarkan index
@app.get("/api/mahasiswa/{index}")
def get_mahasiswa(index: int):
    if 0 <= index < len(mahasiswa_list):
        return mahasiswa_list[index]
    return {"error": "Index tidak ditemukan"}

# POST tambah mahasiswa
@app.post("/api/mahasiswa")
def tambah_mahasiswa(mhs: Mahasiswa):
    mahasiswa_list.append(mhs.dict())
    return {"pesan": "Mahasiswa berhasil ditambahkan", "data": mhs.dict()}

# DELETE mahasiswa berdasarkan index
@app.delete("/api/mahasiswa/{index}")
def hapus_mahasiswa(index: int):
    if 0 <= index < len(mahasiswa_list):
        deleted = mahasiswa_list.pop(index)
        return {"pesan": "Mahasiswa dihapus", "data": deleted}
    return {"error": "Index tidak ditemukan"}

# Menjalankan server dengan ngrok
nest_asyncio.apply()
public_url = ngrok.connect(8000)
print("🚀 Public URL (Swagger UI):", public_url.public_url + "/docs")

uvicorn.run(app, port=8000)
```

#### Cara Penggunaan
1.) Buka Link Google Colab diatas lalu dan run program tugas pendahuluan
![image](https://github.com/user-attachments/assets/e33002c8-b735-4ce1-9ded-1b6c31b0921e)

2.) Klik Link yang terdapat pada Public URL (Swagger UI):
![image](https://github.com/user-attachments/assets/f2000683-00ec-45d6-a978-7152c79d8c64)

3.) Klik visit site
![image](https://github.com/user-attachments/assets/60478f44-6739-4d38-a0e4-152e8bc509a7)
![image](https://github.com/user-attachments/assets/86a7e921-4a35-483f-939d-433f012a504e)

<br>

## MENDEMONSTRASI WEB API
#### A. Mencoba “GET /api/mahasiswa” saat baru dijalankan (mengeluarkan list nama mahasiswa dan nim anggota kelompok):
![image](https://github.com/user-attachments/assets/460fe751-0f13-41ef-9cd3-36d50f73e2f7)

#### B. Menambahkan mahasiswa => Nama: “John Doe” dan NIM: “20250069” dengan “POST /api/mahasiswa”
![image](https://github.com/user-attachments/assets/9628efa2-a15a-4933-9950-ccbcaac4b5a2)

#### C. Cek list/array dari semua mahasiswa lagi dengan “GET /api/mahasiswa”, pastikan mahasiswa yang baru ditambahkan sebelumnya ada di list mahasiswa:
![image](https://github.com/user-attachments/assets/08c9c42e-202c-497a-9236-c2b671d4bc8e)

#### D. Mencoba meminta mahasiswa dengan index 0, “GET /api/mahasiswa/0” yang seharusnya mengeluarkan nama dan nim:
![image](https://github.com/user-attachments/assets/08124b40-4c7a-49ef-baf1-0d1015183438)

#### E. Menghapus objek mahasiswa dengan index ke-0 dengan “DELETE /api/mahasiswa/0”
![image](https://github.com/user-attachments/assets/3a704db5-1a9a-4ee4-871a-767dfce648ed)

#### F. Cek list/array dari semua mahasiswa sekali lagi dengan “GET /api/mahasiswa”, pastikan nama anda sudah tidak muncul di list tersebut:
![image](https://github.com/user-attachments/assets/f1f684f3-fdf7-402e-81ea-65fae0f663e3)

#### Penjelasan
Program di atas adalah sebuah aplikasi REST API sederhana yang dibangun menggunakan FastAPI untuk mengelola data mahasiswa. Pertama, program menginstal dan mengimpor beberapa library penting seperti fastapi, uvicorn, nest_asyncio, dan pyngrok. Selanjutnya, aplikasi diinisialisasi dengan FastAPI, dan token otentikasi untuk Ngrok dikonfigurasi agar memungkinkan akses publik ke server lokal. Model data Mahasiswa didefinisikan menggunakan Pydantic, dan data mahasiswa disimpan dalam list statis sebagai basis data sementara. API menyediakan beberapa endpoint: GET /api/mahasiswa untuk mengambil seluruh data mahasiswa, GET /api/mahasiswa/{index} untuk mengambil data berdasarkan indeks, POST /api/mahasiswa untuk menambah data baru, dan DELETE /api/mahasiswa/{index} untuk menghapus data berdasarkan indeks. Dengan nest_asyncio dan pyngrok, server FastAPI dijalankan secara asinkron dan dibuka ke internet menggunakan URL publik dari Ngrok, sehingga dokumentasi API (Swagger UI) dapat diakses melalui tautan yang dicetak ke konsol.
