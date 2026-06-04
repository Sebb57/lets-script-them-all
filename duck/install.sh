#!/bin/bash

bash duck.sh&
bash duck.sh&
bash duck.sh&

if [ ! -f  "duck.sh" ]; then
    rm duck.sh
    rm -- $0
fi

