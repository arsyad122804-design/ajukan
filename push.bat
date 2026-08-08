@echo off
set "PATH=C:\Program Files\Git\cmd;%PATH%"
echo === MEMULAI AUTO PUSH... ===
git add .
git commit -m "Auto push perbaikan"
git push origin main
echo.
echo === AUTO PUSH SELESAI ===
echo Silakan tekan tombol apapun di keyboard untuk menutup layar ini...
pause >nul
