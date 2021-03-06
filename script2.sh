#!/bin/bash

#Проверяем количество переданных аргументов
#Если количество переданных аргументов не равно 1, то выводим ошибку и прекращаем работу скрипта
if [ $# -ne 1 ]; then
    echo "Ошибка! Требуется указать ровно один аргумент."
    exit
fi

#В переменную N кладем требуемое количество слов
N=$1

#Вводим N штук слов
echo "Ожидается ввод $N слов:"
read WORDS

#Проверяем количество введенных слов
#Если количество введенных слов равно 0, то выводим ошибку и прекращаем работу скрипта
if [ ! "$WORDS" ]; then
    echo "Ошибка! Введенная строка пуста."
    exit
fi

#Обрамляем каждое слово комментариями и вычисляем длину
#Полученный результат помещаем в файл temporary1
for i in $WORDS; do
  echo "Слово: \"$i\"; его длина = " `expr length $i`
done > temporary1

#Проверяем, что количество веденных слов равно количеству запрашиваемых слов
#Если количество введенных слов не равно количеству запрашиваемых слов, то выводим ошибку и прекращаем работу скрипта
COUNT=`cat temporary1 | wc -l`
if [ $COUNT -ne $N ]; then
    echo "Ошибка! Количество введенных слов ($COUNT) не равно количеству запрошенных слов ($N)."
    exit
fi

#Сортируем файл temporary1, вывод направляем в temporary2
sort temporary1 > temporary2
#Удаляем файл temporary1
rm temporary1

#Считываем построчно файл temporary2
while read LINE; do
  echo $LINE
done < temporary2

#Удаляем файл temporary2
rm temporary2
