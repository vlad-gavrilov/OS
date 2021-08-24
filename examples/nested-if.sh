#!/bin/bash
# Объявляем переменную choice равную 4
choice=4
# Выводим на экран
echo "1. Bash"
echo "2. Python"
echo "3. Perl"
echo -n "Выберите, пожалуйста, язык [1,2 или 3] "
# Цикл, пока choice равна 4
while [ $choice -eq 4 ]; do
# Считываем выбор пользователя
read choice
if [ $choice -eq 1 ] ; then
  echo "Вы выбрали язык: Bash"
else
  if [ $choice -eq 2 ] ; then
    echo "Вы выбрали язык: Python"
  else
    if [ $choice -eq 3 ] ; then
      echo "Вы выбрали язык: Perl"
    else
      echo "Выберите язык в диапазоне от 1 до 3!"
      echo "1. Bash"
      echo "2. Python"
      echo "3. Perl"
      echo -n "Выберите, пожалуйста, язык [1,2 или 3] "
      choice=4
    fi
  fi
fi
done