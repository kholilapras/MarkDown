<h1>Konstruksi Perangkat Lunak</h1>
<h2>Nama : Kholil Abdi Prasetiyo<br>NIM : 2211104071<br>Kelas : SE-06-03</h2>
<h3>Tugas Jurnal Pertemuan 15</h3>

<br>

# PENGEMBANGAN DENGAN SECURE CODING PRACTICES

#### SourceCode
main.js
```js
// main.js
const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const fs = require('fs');
const crypto = require('crypto'); // Untuk hashing password

const usersFilePath = path.join(__dirname, 'users.json');

function createWindow() {
    const win = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            preload: path.join(__dirname, 'preload.js'),
            contextIsolation: true, // Penting untuk keamanan
            enableRemoteModule: false, // Disarankan false untuk keamanan
        }
    });

    win.loadFile('index.html');
}

app.whenReady().then(() => {
    createWindow();

    app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) {
            createWindow();
        }
    });
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

// Fungsi untuk membaca data user
const readUsers = () => {
    if (fs.existsSync(usersFilePath)) {
        const data = fs.readFileSync(usersFilePath, 'utf8');
        return JSON.parse(data);
    }
    return [];
};

// Fungsi untuk menulis data user
const writeUsers = (users) => {
    fs.writeFileSync(usersFilePath, JSON.stringify(users, null, 2), 'utf8');
};

// --- Implementasi Secure Coding Practices ---

// Password Hashing (SHA256) 
const hashPassword = (password) => {
    return crypto.createHash('sha256').update(password).digest('hex');
};

// Input Validation: Username dan Password
// Validasi Panjang Data (minimal 8, maksimal 20) 
// Validasi Range Data (hanya huruf alfabet ASCII) 
// Validasi Range Data (harus mengandung angka) 
// Validasi Password Rules (minimal 1 karakter unik, tidak boleh mengandung username) 
const validateRegistrationInput = (username, password) => {
    // Validasi Panjang Data 
    if (username.length < 3 || username.length > 20) {
        return { isValid: false, message: 'Username harus antara 3 sampai 20 karakter.' };
    }
    if (password.length < 8 || password.length > 20) {
        return { isValid: false, message: 'Password harus antara 8 sampai 20 karakter.' };
    }

    // Validasi Range Data (hanya huruf alfabet ASCII untuk username) 
    if (!/^[a-zA-Z0-9]+$/.test(username)) {
        return { isValid: false, message: 'Username hanya boleh mengandung huruf dan angka.' };
    }

    // Validasi Password Rules 
    // Harus mengandung angka 
    if (!/\d/.test(password)) {
        return { isValid: false, message: 'Password harus mengandung setidaknya satu angka.' };
    }
    // Harus mengandung minimal 1 karakter unik (!@#$%^&*) 
    if (!/[!@#$%^&*]/.test(password)) {
        return { isValid: false, message: 'Password harus mengandung setidaknya satu karakter unik (!@#$%^&*).' };
    }
    // Password tidak boleh mengandung kata dari username 
    if (password.toLowerCase().includes(username.toLowerCase())) {
        return { isValid: false, message: 'Password tidak boleh mengandung username.' };
    }

    return { isValid: true, message: 'Validasi berhasil.' };
};

// IPC Main Handler untuk Registrasi 
ipcMain.handle('register-user', (event, { username, password }) => {
    const validation = validateRegistrationInput(username, password);
    if (!validation.isValid) {
        return { success: false, message: validation.message }; // Handling data invalid 
    }

    let users = readUsers();
    // Cek apakah username sudah ada
    if (users.some(user => user.username === username)) {
        return { success: false, message: 'Username sudah terdaftar.' };
    }

    const hashedPassword = hashPassword(password); // Password hashing 
    users.push({ username, password: hashedPassword });
    writeUsers(users);
    return { success: true, message: 'Registrasi berhasil!' };
});

// IPC Main Handler untuk Login 
ipcMain.handle('login-user', (event, { username, password }) => {
    let users = readUsers();
    const hashedPassword = hashPassword(password); // Hash password input untuk perbandingan 

    const user = users.find(user => user.username === username && user.password === hashedPassword);

    if (user) {
        return { success: true, message: 'Login berhasil!' };
    } else {
        return { success: false, message: 'Username atau password salah.' }; // Handling data invalid 
    }
});
```

PusatDataSingleton.js
```js
const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('api', {
    registerUser: (username, password) => ipcRenderer.invoke('register-user', { username, password }),
    loginUser: (username, password) => ipcRenderer.invoke('login-user', { username, password })
});
```

index.html
```js
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aplikasi User</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        input { margin-bottom: 10px; padding: 8px; width: 200px; }
        button { padding: 10px 15px; cursor: pointer; }
        #message { margin-top: 15px; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Registrasi User</h1>
    <input type="text" id="regUsername" placeholder="Username">
    <input type="password" id="regPassword" placeholder="Password">
    <button id="registerButton">Register</button>

    <h1>Login User</h1>
    <input type="text" id="loginUsername" placeholder="Username">
    <input type="password" id="loginPassword" placeholder="Password">
    <button id="loginButton">Login</button>

    <div id="message"></div>

    <script>
        document.getElementById('registerButton').addEventListener('click', async () => {
            const username = document.getElementById('regUsername').value;
            const password = document.getElementById('regPassword').value;
            const result = await window.api.registerUser(username, password);
            document.getElementById('message').innerText = result.message;
            document.getElementById('message').style.color = result.success ? 'green' : 'red';
        });

        document.getElementById('loginButton').addEventListener('click', async () => {
            const username = document.getElementById('loginUsername').value;
            const password = document.getElementById('loginPassword').value;
            const result = await window.api.loginUser(username, password);
            document.getElementById('message').innerText = result.message;
            document.getElementById('message').style.color = result.success ? 'green' : 'red';
        });
    </script>
</body>
</html>
```

#### Output
![image](https://github.com/user-attachments/assets/e4908478-f5e9-4dd5-925d-e78bba352f05)

#### Penjelasan
Program yang dijelaskan adalah aplikasi desktop yang dibangun menggunakan Node.js dan Electron, sebuah framework yang memungkinkan pengembangan aplikasi desktop lintas platform dengan teknologi web. Aplikasi ini memiliki fitur utama registrasi dan login user, serta penyimpanan data user dalam format JSON.

Dalam struktur proyek, main.js berfungsi sebagai entry point utama aplikasi Electron. File ini bertanggung jawab untuk membuat jendela browser, mengelola komunikasi antar-proses (IPC) antara main process dan renderer process (tampilan web), serta menangani logika bisnis seperti membaca dan menulis data user ke file users.json. Sementara itu, preload.js bertindak sebagai jembatan yang aman, mengekspos fungsi-fungsi yang diperlukan dari main process ke renderer process tanpa memberikan akses penuh ke Node.js API. Antarmuka pengguna disediakan oleh index.html, yang berisi formulir untuk registrasi dan login, serta menggunakan JavaScript untuk berinteraksi dengan fungsi-fungsi yang diekspos melalui preload.js.

Aplikasi ini menerapkan praktik secure coding dengan fokus pada validasi input dan manajemen password. Untuk validasi input, program membatasi panjang data, misalnya username antara 3 hingga 20 karakter dan password antara 8 hingga 20 karakter. Selain itu, ada validasi range data yang memastikan username hanya berisi huruf dan angka ASCII, dan password harus mengandung setidaknya satu angka dan satu karakter unik (!@#$%^&*). Data yang tidak valid ditolak dan ditangani dengan pesan kesalahan spesifik, bukan dibiarkan menjadi runtime error. Dalam manajemen password, aplikasi melakukan hashing password menggunakan metode SHA256 sebelum menyimpannya, sehingga password tidak pernah disimpan dalam bentuk plaintext. Aplikasi juga menerapkan aturan password, seperti melarang password mengandung username.
