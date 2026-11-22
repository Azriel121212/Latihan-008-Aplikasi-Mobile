# Latihan Firebase Mobile (Flutter)

Repositori ini berisi proyek latihan integrasi aplikasi mobile Flutter dengan layanan **Firebase Authentication** (Email dan Password), yang telah digabungkan dengan halaman **SplashScreen** serta antarmuka **LoginPage**.

## Identitas Mahasiswa
- **Nama:** Chaerul Azriel Ardiansyah
- **NIM:** 1124160129
- **Kelas:** TI24PSE1
- **Program Studi:** Teknik Informatika (Software Engineering)
- **Institusi:** Institut Teknologi dan Bisnis Bina Sarana Global (Global Institute)

## Fitur Utama
- **SplashScreen:** Tampilan pembuka sebelum mengarahkan pengguna ke halaman autentikasi.
- **Autentikasi Firebase:** Login menggunakan Email dan Password yang terhubung langsung dengan Firebase Authentication.
- **AuthWrapper:** Pemantauan status login secara *real-time* menggunakan `StreamBuilder` (`authStateChanges`) untuk navigasi otomatis antara halaman Login dan Dashboard.
- **Dashboard Pengguna:** Menampilkan informasi akun yang sedang masuk (UID, Email, status verifikasi, dan waktu login terakhir) beserta fitur Logout.

## Langkah Singkat Integrasi Firebase
1. Aktifkan metode autentikasi **Email/Password** pada Firebase Console melalui menu **Authentication > Sign-in method**.
2. Instal Firebase CLI dan lakukan login menggunakan akun Google:
   ```bash
   npm install -g firebase-tools
   firebase login
   ```
3. Aktifkan FlutterFire CLI dan hubungkan proyek Flutter dengan proyek Firebase:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure --project=flutter-projectse1-cbcaf
   ```
4. Tambahkan dependensi Firebase pada proyek Flutter:
   ```bash
   flutter pub add firebase_core
   flutter pub add firebase_auth
   ```
5. Lakukan inisialisasi Firebase di dalam fungsi `main()` pada berkas `lib/main.dart` menggunakan `DefaultFirebaseOptions.currentPlatform`.
6. Terapkan `StreamBuilder` pada `AuthWrapper` untuk mendeteksi status autentikasi pengguna secara otomatis.

## Daftar Tugas dan Progres Pengerjaan
| No | Deskripsi Tugas | Status |
| :---: | :--- | :---: |
| 1 | Konfigurasi Firebase CLI, FlutterFire, `firebase_core`, dan `firebase_auth` | Selesai |
| 2 | Pembuatan halaman `SplashScreen` pada `lib/pages/splash_screen.dart` | Selesai |
| 3 | Integrasi antarmuka `LoginPage` dengan `signInWithEmailAndPassword` | Selesai |
| 4 | Penerapan `AuthWrapper` dan halaman `UserInfoScreen` (Dashboard & Logout) | Selesai |
| 5 | Penyusunan dokumentasi proyek pada berkas `README.md` | Selesai |

## Cara Menjalankan Proyek
1. Pastikan seluruh dependensi sudah terpasang dengan menjalankan:
   ```bash
   flutter pub get
   ```
2. Jalankan aplikasi pada perangkat atau emulator:
   ```bash
   flutter run
   ```