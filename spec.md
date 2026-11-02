# Specification Document: Katalog Menu Kantin Sekolah

**Tanggal:** 22 Oktober 2026  
**Pendekatan:** Spec-Driven Development (SDD)  
**Proyek:** Aplikasi Katalog Menu Kantin Sekolah (Flutter)

---

## 1. Ringkasan Proyek (Overview)
Aplikasi **Katalog Menu Kantin Sekolah** adalah aplikasi mobile berbasis Flutter yang dirancang untuk memudahkan siswa melihat, mencari, dan memilih jajanan/makanan kantin sekolah. Aplikasi ini menyediakan fitur pencarian *real-time*, detail menu, perhitungan harga otomatis berbasis porsi, serta manajemen keranjang belanja sederhana.

---

## 2. User Stories

### US-01: Pencarian & Melibat Daftar Menu (Siswa)
- **As a** Siswa
- **I want to** melihat daftar makanan/minuman kantin dan mencari nama makanan favorit saya di kolom pencarian
- **So that** saya dapat menemukan menu yang ingin saya beli dengan cepat dan mudah.

### US-02: Detail Menu & Hitung Otomatis (Siswa)
- **As a** Siswa
- **I want to** memilih salah satu menu untuk melihat foto, harga, dan menambah/mengurangi jumlah porsi
- **So that** saya mengetahui detail makanan beserta total harga sebelum memesannya.

### US-03: Keranjang Belanja & Pesanan (Siswa)
- **As a** Siswa
- **I want to** memasukkan menu pilihan ke keranjang dan melihat daftar item yang dikumpulkan
- **So that** saya bisa meninjau seluruh pesanan dan total biaya sebelum membeli di kantin.

### US-04: Informasi Kantin (Siswa)
- **As a** Siswa
- **I want to** melihat halaman "Tentang Kantin"
- **So that** saya mengetahui jam operasional, lokasi stang, dan kontak pengurus kantin.

---

## 3. Tech Stack & Batasan Sistem (Tech Stack & Constraints)

### Tech Stack
- **Framework:** Flutter (Dart SDK >= 3.0.0)
- **UI Components:** Material Design, `StatefulWidget`, `TextField`, `ListView.builder`, `Expanded`
- **Typography:** Package `google_fonts`
- **Assets:** `Image.asset` untuk gambar makanan/minuman lokal
- **Navigation:** `Navigator.push` & `Navigator.pop` (Imperative Routing)

### Batasan Sistem (Constraints)
1. **Offline-First / Local Assets:** Seluruh gambar menu disimpan di dalam folder `assets/images/` dan didaftarkan di `pubspec.yaml`.
2. **Minimal 5 Item Menu:** Katalog awal wajib berisi sekurang-kurangnya 5 jenis makanan/minuman (misal: Mi Ayam, Batagor, Es Teh Manis, Bakso, Nasi Goreng).
3. **Responsive & No Overflow:** Tampilan UI tidak boleh mengalami error `Yellow/Black Overflow` pada berbagai ukuran layar Android.
4. **Target Output:** File build executable dalam format `.apk` (`flutter build apk`).

---

## 4. Aturan Bisnis (Business Rules)

1. **Aturan Pencarian Menu:**
   - Filter pencarian bersifat *case-insensitive* (tidak membedakan huruf besar/kecil).
   - Daftar menu harus langsung terbarui (*real-time*) setiap kali karakter pada `TextField` berubah (`onChanged`).

2. **Aturan Perhitungan Harga Otomatis:**
   - Porsi minimal dalam halaman detail adalah 1 item.
   - Total Harga = $\text{Harga Satuan} \times \text{Jumlah Porsi}$.
   - Perubahan jumlah porsi langsung memperbarui variabel State dan UI secara otomatis.

3. **Aturan Arsitektur & Clean Code:**
   - File utama `main.dart` hanya berisi inisialisasi aplikasi (`runApp`).
   - Halaman dipisahkan ke dalam folder/file modular (misal: `screens/home_page.dart`, `screens/detail_page.dart`, `screens/cart_page.dart`, `screens/about_page.dart`).
   - Komponen re-usable (seperti model data `Menu`) dipisahkan ke `models/menu.dart`.
   - Tidak ada widget pembungkus un-used/redundant (`Unused Container/Padding`).

---

## 5. Kriteria Penerimaan (Acceptance Criteria)

### AC-01: Fitur Utama & UI Katalog
- [ ] Kolom pencarian (`TextField`) berada di bagian atas halaman utama.
- [ ] Menampilkan minimal 5 item makanan/minuman menggunakan `ListView.builder` dalam `Expanded`.
- [ ] Gambar menggunakan `Image.asset`.
- [ ] Judul dan nama menu menggunakan font dari `google_fonts`.

### AC-02: Navigasi & Halaman Detail
- [ ] Mengklik salah satu card/item menu memicu `Navigator.push` menuju `DetailPage`.
- [ ] `DetailPage` menampilkan foto besar, nama, deskripsi, harga satuan, dan tombol pengubah porsi (+/-).
- [ ] Total harga bertambah/berkurang secara dinamis sesuai porsi.

### AC-03: Fitur Tantangan / Halaman Ekstra
- [ ] Terdapat halaman **Keranjang Belanja** (`CartPage`) untuk meninjau pesanan.
- [ ] Terdapat halaman **Tentang Kantin** (`AboutPage`) yang berisi informasi jam operasional & lokasi kantin.
- [ ] Struktur folder rapi dan terpisah (`models/`, `screens/`, `widgets/`).

### AC-04: Build & Kualitas Kode
- [ ] Tidak ada error visual *overflow* (garis kuning-hitam) saat dijalankan.
- [ ] Berhasil di-*build* menjadi file `.apk` tanpa error kompilasi.
- [ ] Kode sumber diunggah dan dapat diakses publik melalui repositori GitHub.

---

## 6. Rekomendasi Struktur Folder (Project Structure)

```text
lib/
├── models/
│   └── menu_model.dart
├── screens/
│   ├── home_page.dart
│   ├── detail_page.dart
│   ├── cart_page.dart
│   └── about_page.dart
├── widgets/
│   └── menu_card.dart
└── main.dart