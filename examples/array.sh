#!/bin/bash
# Создаем массив из четырех элементов
ARRAY=( 'Debian Linux' 'Redhat Linux' Ubuntu Linux )
# Получаем количество элементов, т.е. в данном случае 4
ELEMENTS=${#ARRAY[@]}
# Циклом for выводим все элементы массива
for (( i=0;i<$ELEMENTS;i++ ))
do
  echo ${ARRAY[${i}]}
done