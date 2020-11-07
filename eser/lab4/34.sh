#!/bin/bash

# Visualizzare a video le prime tre righe di ciascun file che sta nella directory /usr/include/ e in tutte le sue sottodirectory. Attenzione alle directory

find /usr/include/  -type f  -exec head -n 3 '{}' \;
