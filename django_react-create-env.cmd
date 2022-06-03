@echo OFF
powershell write-host -fore Green ============================================================================
powershell write-host -fore Green NAME: Générator project Django/React-JS
powershell write-host -fore Green AUTHOR: Heidet Antoine
powershell write-host -fore Green DATE: 02/06/2022
powershell write-host -fore Green 
powershell write-host -fore Green VERSION 1.X
powershell write-host -fore Green Script auto-deploy App Project 
powershell write-host -fore Green REQUIRE : Python, NPX and NPM
powershell write-host -fore Green =============================================================================

powershell write-host -fore Blue Language ?: 
powershell write-host -fore Blue [1]: en [2]: fr

set /p choix=
if "%choix%"=="1" goto en
if "%choix%"=="2" goto fr
goto fin


:en
powershell write-host -fore Blue Please enter the project name:
SET /P name=
mkdir %name%
cd %name%
python -m pip install virtualenv
python -m virtualenv venv
CALL venv\Scripts\activate.bat
python -m pip install django
python -m pip install  djangorestframework django-cors-headers
django-admin startproject backend
cd backend


powershell write-host -fore Blue Please enter the project name django/backend:
SET /P namedjangoproject=
python manage.py startapp %namedjangoproject%
python manage.py migrate
powershell write-host -fore Blue Create SuperUser Admin Django:
python manage.py createsuperuser
pip freeze > requirements.txt 
cd ..
powershell write-host -fore Green Install Django and Environnement end.

powershell write-host -fore Blue Deploy React/frontend App:
npx create-react-app frontend
cd frontend
npm i reactstrap
npm i bootstrap
npm install axios

powershell write-host -fore Green ============================================================================
powershell write-host -fore Green Open File: backend/settings.py
powershell write-host -fore Green Please add %namedjangoproject%, 'corsheaders','rest_framework' [INSTALLED_APPS] 
powershell write-host -fore Green Please add 'corsheaders.middleware.CorsMiddleware', [MIDDLEWARE]
powershell write-host -fore Green Please add 'http://localhost:3000' [CORS_ORIGIN_WHITELIST] 
powershell write-host -fore Green =============================================================================

goto fin


:fr
powershell write-host -fore Blue Veuillez entrer le nom du projet:
SET /P name=
mkdir %name%
cd %name%
python -m pip install virtualenv
python -m virtualenv venv
CALL venv\Scripts\activate.bat
python -m pip install django
python -m pip install  djangorestframework django-cors-headers
django-admin startproject backend
cd backend


powershell write-host -fore Blue Veuillez entrer le nom du project django/backend:
SET /P namedjangoproject=
python manage.py startapp %namedjangoproject%
python manage.py migrate
powershell write-host -fore Blue Creation de l'administrateur(SuperUser) Django:
python manage.py createsuperuser
pip freeze > requirements.txt 
cd ..
powershell write-host -fore Green Installation Environnement et Django fini

powershell write-host -fore Blue Deploiement de l'application React/frontend: 
npx create-react-app frontend
cd frontend
npm i reactstrap
npm i bootstrap
npm install axios

powershell write-host -fore Green ============================================================================
powershell write-host -fore Green Ouvrir fichier: backend/settings.py
powershell write-host -fore Green Ajouter %namedjangoproject%, 'corsheaders','rest_framework' [INSTALLED_APPS] 
powershell write-host -fore Green Ajouter 'corsheaders.middleware.CorsMiddleware', [MIDDLEWARE]
powershell write-host -fore Green Ajouter 'http://localhost:3000' [CORS_ORIGIN_WHITELIST] 
powershell write-host -fore Green =============================================================================

goto fin

:fin
cmd /c