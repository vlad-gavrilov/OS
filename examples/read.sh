#!/bin/bash
echo -e "Здравствуйте! Введите, пожалуйста, одно слово:"
read  word
echo "Ваше слово: \"$word\""
echo -e "Введите, пожалуйста, два слова:"
read word1 word2
echo "Ваш ввод: \"$word1\" \"$word2\""
echo -e "Как вам программирование на bash?"
read
echo "Вы сказали \"$REPLY\", рад это слышать!"
echo -e "Какие ваши три любимые цвета?"
read -a colours
echo "У меня тоже любимые цвета ${colours[0]}, ${colours[1]} и ${colours[2]} :-)"