# 📀 Panduan Aplikasi Portabel (Flashdisk) — Offline 100%

Aplikasi ini bisa dibuat **portabel**: seluruh data (tabel rekap, desa, foto) dan mesinnya
disimpan **di dalam folder aplikasi ini sendiri** (bisa di flashdisk), tanpa cloud dan tanpa internet.

Setelah disiapkan sekali, Anda cukup **copy folder ini ke flashdisk** dan menjalankannya
di PC/laptop mana pun.

---

## 🧩 Isi Folder Portabel yang Ideal
```
RasioElektrifikasi/           <- folder utama (boleh di flashdisk)
├── backend/                  <- server & pemroses data (sudah ada)
├── frontend/                 <- tampilan aplikasi (sudah ada)
│   └── build/                <- hasil build tampilan (dibuat oleh SIAPKAN_SEKALI.bat)
├── mongodb/                  <- MongoDB PORTABLE (Anda tambahkan, lihat Langkah A)
│   └── bin/mongod.exe
├── data/db/                  <- TEMPAT DATA ANDA TERSIMPAN (otomatis dibuat)
├── SIAPKAN_SEKALI.bat        <- dijalankan 1x untuk persiapan
└── JALANKAN_APLIKASI.bat     <- klik ganda ini untuk memakai aplikasi
```

---

## 🔧 Langkah A — Siapkan MongoDB Portable (Tanpa Install, Sekali Saja)
Ini yang membuat database **tidak perlu diinstal** & datanya ikut di flashdisk.

1. Buka: `https://www.mongodb.com/try/download/community`
2. Di kolom **Package**, pilih **ZIP** (BUKAN `msi`/installer).
3. Unduh & ekstrak file ZIP-nya.
4. Salin isi folder hasil ekstrak ke folder `mongodb/` di aplikasi ini, sehingga ada file:
   `mongodb\bin\mongod.exe`

> Dengan cara ini, database berjalan langsung dari folder dan **seluruh data Anda
> tersimpan di `data\db`** — ikut terbawa ke mana pun flashdisk dibawa.

---

## 🐍 Langkah B — Python (Prasyarat Ringan)
Aplikasi butuh Python untuk menjalankan server.
- **Cara termudah:** Instal Python 1x di PC (`https://python.org`, centang *"Add Python to PATH"*).
  Setelah itu, flashdisk bisa dipakai di PC tsb kapan saja.
- **Ingin benar-benar tanpa instal di PC lain?** Minta bantuan staf IT untuk menaruh
  *Python Embeddable* di folder `python/`. (Opsional/lanjutan)

---

## ▶️ Langkah C — Persiapan Sekali & Menjalankan
1. **Klik ganda `SIAPKAN_SEKALI.bat`** (hanya sekali di awal).
   - Ini akan memasang komponen server, membangun tampilan, dan menyetel mode offline.
   - Tunggu sampai muncul tulisan **"PERSIAPAN SELESAI!"**.
2. **Klik ganda `JALANKAN_APLIKASI.bat`** setiap kali ingin memakai aplikasi.
   - Aplikasi otomatis terbuka di browser: `http://localhost:8001`
   - **Login:** Username `admin` — Password `adminRE1234#`

---

## 💾 Menyalin ke Flashdisk / PC Lain
Setelah `SIAPKAN_SEKALI.bat` selesai dijalankan sekali:
1. Salin **seluruh folder aplikasi** ke flashdisk.
2. Colokkan ke PC lain (yang sudah ada Python), buka foldernya,
   klik ganda **`JALANKAN_APLIKASI.bat`** — langsung jalan, tanpa setting lagi.

Seluruh data & foto Anda tersimpan di dalam folder `data/db` dan `backend/local_storage`,
sehingga **ikut terbawa bersama flashdisk** dan **tidak pernah tersimpan online**.

---

## ❓ Tanya Jawab Singkat
- **Butuh internet?** Tidak. Semua berjalan lokal di PC/flashdisk.
- **Data saya di mana?** Di folder `data\db` (database) & `backend\local_storage` (foto).
- **Aman & pribadi?** Ya. Dilindungi login admin dan tidak dikirim ke mana pun.
- **Ganti password admin?** Bisa lewat menu *Pengguna Admin* di dalam aplikasi.
