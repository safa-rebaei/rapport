@echo off
setlocal
cd /d "%~dp0"

echo === Nettoyage des fichiers auxiliaires ===
del /f /q *.aux *.log *.toc *.out *.synctex.gz *.fdb_latexmk *.fls 2>nul

echo === Passe 1 ===
pdflatex -interaction=nonstopmode -halt-on-error --enable-installer main.tex
if errorlevel 1 goto error

echo === Passe 2 ===
pdflatex -interaction=nonstopmode -halt-on-error --enable-installer main.tex
if errorlevel 1 goto error

echo === Passe 3 - resolution finale des references ===
pdflatex -interaction=nonstopmode -halt-on-error --enable-installer main.tex
if errorlevel 1 goto error

echo ================================
echo === COMPILATION TERMINEE ! ===
echo ================================

echo === Ouverture du PDF ===
start "" main.pdf

pause
exit /b 0

:error
echo ================================
echo === ERREUR DE COMPILATION ===
echo ================================
echo Consulte main.log pour plus de details.
pause
exit /b 1
