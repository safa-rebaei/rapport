@echo off
cd /d "C:\Users\rebae\Downloads\notrepfe"

echo === Nettoyage fichiers auxiliaires ===
del /f /q *.aux *.log *.toc *.out *.synctex.gz 2>nul

echo === Passe 1 ===
pdflatex -interaction=nonstopmode --enable-installer main.tex

echo === Passe 2 ===
pdflatex -interaction=nonstopmode --enable-installer main.tex

echo === Passe 3 (résolution finale des références) ===
pdflatex -interaction=nonstopmode --enable-installer main.tex

echo ================================
echo === COMPILATION TERMINEE ! ===
echo ================================

echo === Ouverture du PDF ===
start main.pdf

pause