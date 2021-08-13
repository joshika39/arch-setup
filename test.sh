#!/bin/bash

if (( $(id -u) == 0 )); then
	echo Suudoo
fi


if (( $(id -u) != 0 )) ; then
	echo Noo Suudoo
fi
