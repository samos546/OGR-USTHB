@echo off
cd /d "%~dp0"
title StudyOS Local Server
echo Starting StudyOS...
where py >nul 2>nul
if %errorlevel%==0 (start "StudyOS" http://localhost:4173 & py -m http.server 4173) else (
 where python >nul 2>nul
 if %errorlevel%==0 (start "StudyOS" http://localhost:4173 & python -m http.server 4173) else (echo Python 3 was not found. Install it from https://www.python.org/downloads/ and check Add Python to PATH. & pause)
)
