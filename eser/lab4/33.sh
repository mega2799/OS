#!/bin/bash

# Visualizzare a video il nome dei file che soddisfano due condizioni  1) stanno nelle directory immediatamente figlie della directory /usr/include/   2)  hanno  nome che termina con  net.h

find "/usr/include" -name "*net.h"
