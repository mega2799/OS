#!/bin/bash

# Aggiungere un comando in pipe al comando precedente per visualizzare solo i primi 3 caratteri di ciascuna riga.

find /usr/include/  -type f  -exec head -n 3 '{}' \; | cut -b -3
