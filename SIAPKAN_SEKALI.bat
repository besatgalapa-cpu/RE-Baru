@echo off
chcp 65001 >nul
title PERSIAPAN APLIKASI OFFLINE (Cukup Dijalankan 1 Kali)
color 0B

echo ================================================================
echo   PERSIAPAN SISTEM RASIO ELEKTRIFIKASI - MODE OFFLINE/PORTABLE
echo   (Proses ini cukup dilakukan SEKALI di awal)
echo ================================================================
echo.

cd /d "%~dp0"

echo [1/4] Membuat konfigurasi server offline (backend\.env)...
> backend\.env echo MONGO_URL="mongodb://localhost:27017"
>> backend\.env echo DB_NAME="rasio_elektrifikasi_lokal"
>> backend\.env echo CORS_ORIGINS="*"
>> backend\.env echo JWT_SECRET="kunci_rahasia_offline_murung_raya_2026"
>> backend\.env echo ADMIN_USERNAME="admin"
>> backend\.env echo ADMIN_PASSWORD="adminRE1234#"
>> backend\.env echo ADMIN_NAME="Administrator"
>> backend\.env echo STORAGE_MODE="local"
>> backend\.env echo LOCAL_STORAGE_DIR="local_storage"

echo [2/4] Membuat konfigurasi tampilan (same-origin, tanpa internet)...
> frontend\.env echo REACT_APP_BACKEND_URL=
>> frontend\.env echo ESLINT_NO_DEV_ERRORS=true
>> frontend\.env echo GENERATE_SOURCEMAP=false

echo [3/4] Memasang komponen server (Python)... mohon tunggu...
cd backend
python -m pip install -r requirements.txt
cd ..

echo [4/4] Membangun tampilan aplikasi (React build)... mohon tunggu...
cd frontend
call yarn install
call yarn build
cd ..

echo.
echo ================================================================
echo  PERSIAPAN SELESAI!
echo  Sekarang Anda bisa menjalankan aplikasi kapan saja dengan
echo  klik ganda file:  JALANKAN_APLIKASI.bat
echo ================================================================
pause
