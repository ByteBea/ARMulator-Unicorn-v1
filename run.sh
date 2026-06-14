#!/bin/bash

# Identifica la cartella dello script in modo compatibile sia con Linux che con macOS
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

echo "=== Inizializzazione ARMulator-Unicorn ==="
echo "Cartella di progetto: $SCRIPT_DIR"

# Controlla se python3 è installato
if ! command -v python3 &> /dev/null; then
    echo "Errore: 'python3' non è installato sul sistema."
    echo "Controlla i prerequisiti per il tuo sistema operativo (Linux/macOS)."
    exit 1
fi

# Crea il Virtual Environment se non esiste
if [ ! -d "$SCRIPT_DIR/venv" ]; then
    echo "[1/3] Creazione del Virtual Environment..."
    python3 -m venv "$SCRIPT_DIR/venv"
    if [ $? -ne 0 ]; then
        echo "Errore durante la creazione del venv. Verifica di avere i pacchetti necessari installati."
        exit 1
    fi
fi

# Attiva il venv
echo "[2/3] Attivazione ambiente isolato..."
source "$SCRIPT_DIR/venv/bin/activate"

# Aggiorna pip e installa i requisiti
echo "[3/3] Installazione/Verifica delle dipendenze..."
pip install --upgrade pip
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "Avviso: requirements.txt non trovato, installo websockets manualmente..."
    pip install websockets
fi

# Avvia l'applicazione
echo "=== Avvio di mainweb.py ==="
python mainweb.py