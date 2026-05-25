from Unicorn_ENgine import UnicornEmulator  #importare la classe da min_engine
#questo codice chiama il codice del motore e gli passa il file arm da assemblare
#da copiare poi nel file nel progetto che manda il codice al motore
#per ora lanciarlo in questa modatità: python3 main.py samples/exampleweb.asm
emu = UnicornEmulator()     
emu.dichiarazione_var()         
emu.input_file()
emu.setup()
emu.mappatura_mem()
emu.sincronizzazione_iniziale()
emu.run()
emu.verifica()
emu.stampa_history()
