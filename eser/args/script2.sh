#!/bin/bash
echo now i\'ll reverse the shit out of you
for (( i=$# ; $i > 0; i = $i -1 ));do
	echo ${!i}
done;
