$git = "$env:LOCALAPPDATA\Programs\MinGit\cmd\git.exe"
Set-Location "c:\Users\ELCOT\OneDrive\Desktop\real estate"

Write-Output "Configuring Git identity..."
& $git config --global user.name "irfan060108-star"
& $git config --global user.email "irfan060108-star@users.noreply.github.com"
& $git config user.name "irfan060108-star"
& $git config user.email "irfan060108-star@users.noreply.github.com"

# Remove helper setup scripts if present
Remove-Item -Path "setup_git.ps1" -Force -ErrorAction SilentlyContinue

Write-Output "Staging files..."
& $git add -A

Write-Output "Committing files..."
& $git commit -m "Initial commit: BuildPro Real Estate Project Management System with Django REST backend and React frontend"

Write-Output "Setting main branch..."
& $git branch -M main

Write-Output "Pushing to GitHub..."
& $git push -u origin main
