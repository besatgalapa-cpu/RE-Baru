@echo off
chcp 65001 >nul
title Sistem Rasio Elektrifikasi Murung Raya (OFFLINE)
color 0A

echo ================================================================
echo    SISTEM LAPORAN RASIO ELEKTRIFIKASI - KAB. MURUNG RAYA
echo                MODE OFFLINE (Tanpa Internet)
echo ================================================================
echo.

cd /d "%~dp0"

echo [1/4] Menyalakan database lokal (data tersimpan di folder ini)...
if not exist "data\db" mkdir "data\db"
start "Database Lokal" /min mongodb\bin\mongod.exe --dbpath "data\db" --port 27017

echo [2/4] Menunggu database siap...
timeout /t 5 /nobreak >nul

echo [3/4] Menyalakan server aplikasi (tampilan + pemroses data jadi satu)...
cd backend
start "Server Aplikasi" /min python -m uvicorn server:app --host 127.0.0.1 --port 8001
cd ..

echo [4/4] Menunggu server siap lalu membuka aplikasi...
timeout /t 6 /nobreak >nul
start http://localhost:8001

echo.
echo ================================================================
echo  Aplikasi sudah TERBUKA di browser Anda.
echo  Login:  Username = admin   Password = adminRE1234#
echo.
echo  PENTING: Biarkan jendela hitam ini tetap terbuka selama
echo  Anda menggunakan aplikasi. Tutup jendela ini untuk berhenti.
echo ================================================================
pause

echo Menghentikan server...
taskkill /IM mongod.exe /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq Server Aplikasi*" /F >nul 2>&1
