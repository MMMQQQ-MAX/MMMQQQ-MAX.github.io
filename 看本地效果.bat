@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo   正在启动本地预览，几秒后会打开浏览器……
echo   看完想关闭，在这个黑窗口按 Ctrl+C 即可。
echo.
start "" powershell -NoProfile -Command "Start-Sleep 7; Start-Process 'http://localhost:4321/'"
call pnpm dev
pause
