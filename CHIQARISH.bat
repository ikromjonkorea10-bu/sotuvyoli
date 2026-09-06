@echo off
chcp 65001 >nul
cd /d "%~dp0"
set LOG=%~dp0_log.txt
echo === SOTUVYOLI -^> GITHUB PAGES === > "%LOG%"

echo [1/5] git init >> "%LOG%" 2>&1
git init -b main >> "%LOG%" 2>&1

echo [2/5] fayllarni qoshish >> "%LOG%" 2>&1
git add -A >> "%LOG%" 2>&1
git -c user.name="ikromjonkorea10-bu" -c user.email="324626259+ikromjonkorea10-bu@users.noreply.github.com" commit -m "Sotuv yo'li - sotuv sahifasi" >> "%LOG%" 2>&1

echo [3/5] github repo >> "%LOG%" 2>&1
gh repo create sotuvyoli --public --source=. --push >> "%LOG%" 2>&1

echo [4/5] github pages yoqish >> "%LOG%" 2>&1
gh api -X POST "repos/ikromjonkorea10-bu/sotuvyoli/pages" -f "source[branch]=main" -f "source[path]=/" >> "%LOG%" 2>&1

echo [5/5] holat >> "%LOG%" 2>&1
gh api "repos/ikromjonkorea10-bu/sotuvyoli/pages" >> "%LOG%" 2>&1

echo. >> "%LOG%"
echo === TUGADI === >> "%LOG%"
echo.
echo Tugadi. Natija: _log.txt
timeout /t 8 >nul
