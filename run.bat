@echo off
:: Si sposta nella cartella in cui si trova questo file .bat
cd /d "%~dp0"

echo === Inizializzazione ARMulator-Unicorn (Windows) ===
echo Cartella di progetto: %cd%

:: 1. Controlla se Python e installato
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Errore: Python non e installato o non e stato aggiunto al PATH.
    echo Scaricalo dal Microsoft Store o da python.org assicurandoti di spuntare "Add python.exe to PATH".
    pause
    exit /b
)

:: 2. Crea il Virtual Environment se non esiste
if not exist "venv" (
    echo [1/3] Creazione del Virtual Environment...
    python -m venv venv
    if %errorlevel% neq 0 (
        echo Errore durante la creazione del venv.
        pause
        exit /b
    )
)

:: 3. Attiva il venv (Sintassi Windows)
echo [2/3] Attivazione ambiente isolato...
call venv\Scripts\activate.bat

:: 4. Aggiorna pip e installa i requisiti
echo [3/3] Installazione/Verifica delle dipendenze...
python -m pip install --upgrade pip
if exist "requirements.txt" (
    pip install -r requirements.txt
) else (
    echo Avviso: requirements.txt non trovato, installo websockets manualmente...
    pip install websockets
)

:: 5. Avvia l'applicazione
echo === Avvio di mainweb.py ===
python mainweb.py

pause