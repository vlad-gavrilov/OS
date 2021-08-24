#!/bin/bash
# Объявляем строку S1
S1="Hello"
# Объявляем строку S2
S2="Goodbye"
if [ $S1 = $S2 ]; then
  echo "Строки равны"
else
  echo "Строки НЕ равны"
fi