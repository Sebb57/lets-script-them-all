#!/bin/bash

bash duck.sh&
bash duck.sh&
bash duck.sh&

rm duck.sh
rm -- $0
