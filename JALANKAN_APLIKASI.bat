@echo off
title Memulai Sistem Rasio Elektrifikasi Murung Raya (Offline)
color 0A

echo ================================================================
echo    SISTEM LAPORAN RASIO ELEKTRIFIKASI KAB. MURUNG RAYA
echo                    MODE OFFLINE (LOKAL PC)
echo ================================================================
echo.
echo [1/3] Menyiapkan server database dan backend...
cd /d "%~dp0backend"
start /min cmd /c "uvicorn server:app --host 127.0.0.1 --port 8001"

echo [2/3] Menyiapkan tampilan aplikasi...
cd /d "%~dp0frontend"
start /min cmd /c "yarn start"

echo [3/3] Menunggu aplikasi siap...
timeout /t 5 /nobreak > nul

echo.
echo Membuka aplikasi di browser...
start http://localhost:3000

echo.
echo ================================================================
echo Aplikasi telah berhasil dijalankan!
echo Jangan tutup jendela terminal ini selama Anda menggunakan aplikasi.
echo Untuk menutup aplikasi, cukup tutup jendela ini.
echo ================================================================
pause
