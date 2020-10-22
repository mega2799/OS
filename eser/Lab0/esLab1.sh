#!/usr/bin/bash

#ES 1
echo ${HOME} ${USER} ${DISPLAY};

#ES 2

 #echo "print env"; env ;
echo "env | grep HOME";  env | grep -o ${HOME} ;
echo "env | grep ${USER}";  env | grep -o ${USER};
echo "env | grep ${DISPLAY}" ;env | grep -o ${DISPLAY};

#ES 3
PIPPO=${USER}${HOME}${DISPLAY};
echo "concaten pippo: ${PIPPO}";

