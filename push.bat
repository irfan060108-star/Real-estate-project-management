@echo off
title Push BuildPro REPM to GitHub
echo ======================================================================
echo   Pushing BuildPro to https://github.com/irfan060108-star/Real-estate-project-management.git
echo ======================================================================
echo.
"%LOCALAPPDATA%\Programs\MinGit\cmd\git.exe" push -u origin main
echo.
pause
