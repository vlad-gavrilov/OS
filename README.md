# Bash Scripting

## Командный интерпретатор

Командный интерпретатор — компьютерная программа, которая обеспечивает возможность управления компьютером посредством ввода пользователем команд через интерфейс командной строки или исполнения пакетных командных файлов. Во всех дистрибутивах Linux по умолчанию используется командный интерпретатор bash. Командный интерпретатор bash является самой популярной командной оболочкой в Linux. Название bash это акроним от англ. Bourne again shell, что является каламбуром от «Born again» shell — «возрождённый» shell. Bash может работать как в интерактивном режиме, так и читать команды из файла, называемого скриптом. Помимо этого, bash поддерживает автодополнение имён файлов и каталогов, подстановку вывода результата команд, переменные, контроль за порядком выполнения, операторы ветвления и цикла.
В системе может быть установлено несколько оболочек. Список установленных оболочек содержится в файле /etc/shells. Но, в силу популярности bash, будем рассматривать именно эту оболочку.

## Настройки bash

Для настройки bash используются следующие файлы:

1. /etс/profile
2. ~/.bash_profile
3. ~/.bashrc
4. ~/.bash_logout

Файл /etс/profile отвечает за глобальные настройки всей системы. При его редактировании изменения затронут всех пользователей системы. Команды, расположенные в файле ~/.bash_profile, обрабатываются и выполняются при каждом входе в систему конкретного пользователя. В настоящее время данный файл либо вовсе не существует, либо состоит из одной строки source ~/.bashrc, которая означает, что все команды далее будут браться из файла .bashrc. Таком образом файл ~/.bashrc является основным конфигурационным файлом, но влияющим на оболочку только текущего пользователя. Аналогично ~/.bash_profile, файл ~/.bash_logout обрабатывается при каждом выходе из системы. Помимо вышеперечисленных файлов, полезным может оказаться файл ~/.bash_history, хранящий историю введенных пользователем команд.

Как правило, в файле .bashrc задаются псевдонимы команд (aliases), внешний вид приглашения командной строки, присваиваются значения переменным окружения.

Псевдонимы команд задаются с помощью команды `alias` (от англ. кличка, прозвище). Примеры задания псевдонимов:

```bash
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
```

Псевдонимы работают так: при вызове выражения, стоящего слева от знака "=", будет вызвана команда, записанная в кавычках, справа от знака "=". Например, при вызове команды l на самом деле будет вызвана команда `ls -CF`.

За внешний вид приглашения командной строки отвечает переменная PS1. По умолчанию командная строка имеет формат: `пользователь@компьютер:рабочий_каталог`. Значение PS1 при этом будет

```bash
PS1='\u@\h:\w$'.
```

Список модификаторов командной строки:

```text
\a    ASCII-символ звонка (код 07)
\d    Дата в формате "день недели, месяц, число"
\h    Имя компьютера до первой точки
\H    Полное имя компьютера
\j    Количество задач, запущенных в оболочке в данное время
\l    Название терминала
\n    Символ новой строки
\r    Возврат каретки
\s    Название оболочки
\t    Время в 24-часовом формате (ЧЧ: MM: СС)
\T    Время в 12-часовом формате (ЧЧ: ММ: СС)
\@    Время в 12-часовом формате (AM/PM)
\u    Имя пользователя
\v    Версия bash (сокращенный вариант)
\V    Версия bash (полная версия: номер релиза, номер патча)
\w    Текущий каталог (полный путь)
\W    Текущий каталог (только название каталога, без пути)
\!    Номер команды в истории
\#    Системный номер команды
\$    Если UID пользователя равен 0, будет выведен символ #, иначе — символ $
\\    Обратный слэш
$( )  Подстановка внешней команды
```

Переменные окружения задаются следующим образом:

```bash
export Имя_переменной=Значение
```

## "Hello, world!" на bash

Для написания простой программы "Hello, world!" понадобится создать простой текстовый файл. В первой строке этого файла должен располагаться шебанг (*shebang* — это последовательность символов #!) и имя файла программы-интерпретатора. В нашем случае эта программа bash, поэтому первая строка скрипта будет иметь вид: `#!/bin/bash`.
Назовем данный файл hello-world. Так как созданные файлы по умолчанию запрещены для выполнения, нужно изменить права доступа. Для этого с помощью команды `chmod -x hello-world` изменим тип файла на разрешенный для выполнения.
Запишем в файл hello-world следующий скрипт:

```bash
#!/bin/bash
echo "Hello, world!"
```

Затем в командной строке с помощью команды cd переходим в каталог, в котором содержится файл hello-world и запускаем наш скрипт на выполнение:

`./hello-world`

В командной строке появится вывод программы:

`Hello, world!`

## Переменные

В этом примере объявим переменную STR и выведем ее на экран с помощью команды echo:

```bash
#!/bin/bash
STR="Hello, World!"
echo $STR
```

Программа выведет строку "Hello, World!". Заметим, что при объявлении переменной знак \$ не используется, в то время как при использовании уже объявленной переменной знак \$ обязателен.

## Глобальные и локальные переменные

В следующем скрипте создадим глобальные и локальные переменные.

```bash
#!/bin/bash
# Создадим глобальную переменную
# Глобальные переменные могут быть использованы всюду
VAR="global variable"
function bash {
  # Создадим локальную переменную
  # Локальная переменная видна только в теле функции
  local VAR="local variable"
  echo $VAR
}

# Вызов глобальной переменной
echo $VAR
# Вызов функции
bash
# Вызов глобальной переменной
echo $VAR
```

Вывод программы:

```text
global variable
local variable
global variable
```

Как мы можем видеть, локальная переменная VAR не "затирает" глобальную переменную с тем же именем. Стоит также отметить, что слово local является зарезервированным словом bash.

## Передача аргументов в bash-скрипт

В bash используются предопределенные переменные для доступа к переданным в скрипт параметрам. Эти переменные имеют вид: \$1, \$2, \$3, …, \$n, где \$n — переменная, хранящая n-ый переданный параметр. Также мы можем считать все аргументы в массив с помощью \$@. Количество всех аргументов, переданных в скрипт, хранится в переменной \$\#. Рассмотрим пример:

```bash
#!/bin/bash
# Вывод 1-го, 2-го и 3-го аргументов
echo $1 $2 $3

# Запись в массив arg_arr всех переданных аргументов
arg_arr=("$@")

# Вывод 1-го, 2-го и 3-го аргументов через массив arg_arr
echo ${arg_arr[0]} ${arg_arr[1]} ${arg_arr[2]}

# Вывод аргументов массива с помощью $@
echo $@

# Вывод количества аргументов, переданных в скрипт
echo Number of arguments passed: $#
```

Запустим программу с тремя аргументами:

`./hello-world 234 -6 hello`

Вывод программы:

```text
234 -6 hello
234 -6 hello
234 -6 hello
Number of arguments passed: 3
```

## Выполнение команд shell с помощью bash

Для выполнения различных консольных команд текст команды обрамляется одиночными обратными кавычками и выводится командой echo. Заметим, что без использования кавычек или при использовании прямых одиночных кавычек, вместо обратных, текст не будет интерпретирован как команда, а будет выведен на экран как простая строка.

```bash
#!/bin/bash
# Выполнение команды в обратных кавычках
echo `uname -o`
# Выполнение команды в прямых кавычках
echo 'uname -o'
# Выполнение команды без кавычек
echo uname -o
```

Вывод:

```text
GNU/Linux
uname -o
uname -o
```

## Чтение строк

Читать строки во время выполнения программы можно с помощью команды read. Если указать команду read без каких-либо аргументов, то весь ввод будет храниться в специальной переменной \$REPLY. Если же указать команду read -a array_name (где array_name — это произвольное имя массива), то каждое слово введенной строки будет храниться в соответствующей ячейке массива с именем array_name. Пример:

```bash
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
```

Вывод:

```text
Здравствуйте! Введите, пожалуйста, одно слово:
Привет!
Ваше слово: "Привет!"
Введите, пожалуйста, два слова:
Один два 
Ваш ввод: "Один" "два"
Как вам программирование на bash?
Хорошо
Вы сказали "Хорошо", рад это слышать!
Какие ваши три любимые цвета?
красный синий зеленый
У меня тоже любимые цвета красный, синий и зеленый :-)
```

## Trap-команды в bash

У bash имеется встроенная команда trap, которая может перехватывать команды и выполнять какие-либо действия, заданные ей.
Синтаксис команды:
`trap command signals`, где
*command* — то, что будет выполняться при перехвате сигнала;
*signals* — список сигналов, которые необходимо перехватывать. Сигналы можно указывать как в полном виде — SIGTERM, так и в виде кода – 1, 2 и т.д.
Рассмотрим простой пример скрипта, в котором цикл будет выполняться от 1 до 10. Когда он получит сигнал Ctrl+C (SIGINT – interrupt) будет вызвана функция bashtrap в теле которой выводится перевод на новую строку, а затем строка `Обнаружен вызов CTRL+C! Выполняю функцию bashtrap!`:

```bash
#!/bin/bash
# При получении сигнала INT будет вызвана функция bashtrap
trap bashtrap SIGINT
# Очистить экран
clear;
# Функция bashtrap
bashtrap()
{
  echo
  echo "Обнаружен вызов CTRL+C! Выполняю функцию bashtrap!"
}
# Цикл от 1 до 10
for a in `seq 1 10`; do
  echo "$a/10 to Exit."
  sleep 1;
done
echo "Exit Bash Trap Example!!!"
```

Вывод:

```text
1/10 to Exit.
2/10 to Exit.
3/10 to Exit.
4/10 to Exit.
^C
Обнаружен вызов CTRL+C! Выполняю функцию bashtrap!
5/10 to Exit.
6/10 to Exit.
7/10 to Exit.
8/10 to Exit.
^C
Обнаружен вызов CTRL+C! Выполняю функцию bashtrap!
9/10 to Exit.
10/10 to Exit.
Exit Bash Trap Example!!!
```

## Массивы

Массивы в bash задаются перечислением элементов в круглых скобках. Если элемент массива — строка из нескольких слов, то ее нужно взять в одинарные кавычки, иначе каждое из слов этой строки будет отдельным элементом массива.
Получить количество элементов массива можно с помощью `${#ARRAY[@]}`, где ARRAY — имя массива. Индексация массива начинается с 0.

```bash
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
```

Вывод:

```text
Debian Linux
Redhat Linux
Ubuntu
Linux
```

## Простой оператор ветвления

Оператор ветвления bash реализован также, как и в других языках программирования. Но есть свои особенности. Например, условие заключено в квадратные скобки, причем после открывающей скобки и перед закрывающей обязательно должен быть пробел: `[ condition ]`. Если условие верно, то выполняются команды, идущие после слова `then`, если же условие ложно, то выполняются команды после `else`. Концом оператора `if` должно является слово `fi` (if наоборот). Рассмотрим пример, проверяющий существует ли в текущем каталоге заданная директория:

```bash
#!/bin/bash
directory="./BashScripting"
# Существует ли заданная директория?
if [ -d $directory ]; then
  echo "Directory exists"
else
  echo "Directory does not exist"
fi
```

В зависимости от того, существует ли заданная директория или нет, скрипт выведет "Directory exists" или "Directory does not exist".

## Вложенные операторы ветвления

Оператор ветвления может содержать в себе бесконечно много других операторов ветвления, которые, в свою очередь, тоже могут содержать другие операторы ветвления и так до бесконечности. Рассмотрим пример:

```bash
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
```

Вывод программы:

```text
1. Bash
2. Python
3. Perl
Выберите, пожалуйста, язык [1,2 или 3] 2
Вы выбрали язык: Python
```

## Арифметическое сравнение в bash

Для обозначения сравнения двух величин используются следующие выражения:

```text
-lt        <         меньше               less-than
-gt        >         больше               greater-than
-le        <=        меньше или равно     less or equal
-ge        >=        больше или равно     greater or equal
-eq        ==        равно                equal
-ne        !=        неравно              not equal
```

Пример:

```bash
NUM1=2
NUM2=1
if   [ $NUM1 -eq $NUM2 ]; then
  echo "Both Values are equal"
elif [ $NUM1 -gt $NUM2 ]; then
  echo "NUM1 is greater than NUM2"
else
  echo "NUM2 is greater than NUM1"
fi
```

Вывод:

```text
NUM1 is greater than NUM2
```

## Сравнение строк в bash

```text
=        equal           равны 
!=       not equal       не равны 
<        less-than       меньше чем
>        greater-than    больше чем
-n s1                    строка s1 не пуста
-z s1                    строка s1 пуста
```

Пример:

```bash
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
```

Вывод:

```text
Строки НЕ равны
```

## Цикл for

Цикл for в bash имеет структуру, аналогичную циклам for в других языках. Вывести числа от 1 до 10 можно, например, тремя различными способами, используя цикл for:

```bash
#!/bin/bash
for i in 1 2 3 4 5 6 7 8 9 10; do
  echo $i
done
```

```bash
#!/bin/bash
for i in `seq 1 10`; do
  echo $i
done
```

```bash
#!/bin/bash
for (( i=1;i<=10;i++ )); do
  echo $i
done
```

Более сложный пример, демонстрирующий как с помощью цикла for  можно вывести содержимое данной директории:

```bash
#!/bin/bash
for f in $( ls /var/ ); do
  echo $f
done
```

Вывод:

```text
backups
cache
games
lib
local
lock
log
mail
opt
run
spool
tmp
```

## Цикл while

Цикл while выполняется до тех пор, пока условие истинно. Синтаксис условия цикла аналогичен синтаксису условия if-оператора: `[ condition ]`.

```bash
#!/bin/bash
COUNT=6
while [ $COUNT -gt 0 ]; do
  echo Значение переменной равно: $COUNT
  let COUNT=COUNT-1
done
```

Вывод:

```text
Значение переменной равно: 6
Значение переменной равно: 5
Значение переменной равно: 4
Значение переменной равно: 3
Значение переменной равно: 2
Значение переменной равно: 1
```

## Цикл unti

Цикл until в bash аналогичен циклу while с той лишь разницей, что цикл будет выполняться до тех пор, пока условие ложно. Как только условие станет истинно, цикл прекратит свою работу.

```bash
#!/bin/bash
COUNT=6
until [ $COUNT -le 0 ]; do
  echo Значение переменной равно: $COUNT
  let COUNT=COUNT-1
done
```

Вывод:

```text
Значение переменной равно: 6
Значение переменной равно: 5
Значение переменной равно: 4
Значение переменной равно: 3
Значение переменной равно: 2
Значение переменной равно: 1
```

## Функции

Функции в bash могут быть заданы разными способами. Обязательно должно присутствовать ключевое слово function или фигурные скобки после имени функции. В фигурных скобках находится тело функции. Способы задания функции приведены в примере:

```bash
#!/bin/bash
function function_A {
  echo $1
}
function_B() {
  echo Function B
}
function function_C() {
  echo $1
}
function function_D {
  echo Function D
}

function_A "Function A"
function_B
function_C "Function C"
function_D
```

Вывод:

```text
Function A
Function B
Function C
Function D
```

## Условный case-оператор

Case-оператор в bash имеет следующую структуру:

```text
case переменная in
  значение_1) действия в случае переменная=значение_1;;
  значение_2) действия в случае переменная=значение_2;;
  значение_3) действия в случае переменная=значение_3;;
  …
  значение_n) действия в случае переменная=значение_n;;
  *) действия во всех остальных случаях;;
esac
```

Пример:

```bash
#!/bin/bash
echo "What is your preferred programming/scripting language?"
echo "1) bash"
echo "2) perl"
echo "3) python"
echo "4) c++"
echo "5) I do not know!"
read ans;
case $ans in
  1) echo "You selected bash";;
  2) echo "You selected perl";;
  3) echo "You selected python";;
  4) echo "You selected c++";;
  5) exit;;
  *) echo "Unknown language";;
esac
```

Вывод:

```text
What is your preferred programming/scripting language?
1) bash
2) perl
3) python
4) c++
5) I do not know!
3
You selected python
```

## Экранирование мета-символов

В bash есть некоторые символы, которые несут в себе некоторую информацию для интерпретатора. Например, символ \$ позволяет интерпретатору отличать название переменной от обычной строки. Такие символы называются мета-символы. Бывают случаи, когда нам нужно вывести эти символы на экран. Допустим, нам понадобилось вывести строку "\$BASH_VAR". При попытке вызвать команду `echo $BASH_VAR` интерпретатор bash либо вообще ничего не выведет, либо, если переменная с именем BASH_VAR уже определена, выведет значение этой переменной. Так как оба варианта не являются удовлетворительными, существует способ экранирования мета-символов с помощью символа "\" (обратный слеш). Для того, чтобы вывести символ буквально, перед ним нужно поставить знак обратного слеша. Например, для вывода строки "\$BASH_VAR" нужно вызвать команду `echo \$BASH_VAR`. Аналогично экранируются и все другие мета-символы.

Пример:

```bash
#!/bin/bash
# Объявляем переменную BASH_VAR
BASH_VAR="Bash Script"
# Выводим значение переменной BASH_VAR
echo $BASH_VAR
# Выводим строку $BASH_VAR
echo \$BASH_VAR
# Выводим строку, содержащую только символ обратного слеша
echo "\\"
```

Вывод:

```text
Bash Script
$BASH_VAR
\
```

## Одиночные кавычки

Одиночные кавычки в bash призваны подавлять вывод значения мета-символов. Поэтому любой мета-символ, взятый в кавычки, будет выведен буквально — так, как он выглядит. При этом в строке, заключенной в одиночные кавычки, невозможно использовать еще одни кавычки, даже экранированные обратным слешем.

Рассмотрим пример:

```bash
#!/bin/bash
# Инициализируем переменную BASH_VAR
BASH_VAR="Bash Script"
# Выводим значение переменной BASH_VAR
echo $BASH_VAR
# Выводим строку, содержащую мета-символы "" (кавычки) и $ (знак доллара)
echo '$BASH_VAR  "$BASH_VAR"'
```

Вывод:

```text
Bash Script
$BASH_VAR  "$BASH_VAR"
```

## Двойные кавычки

Двойные кавычки в bash позволяют подавлять вывод значения всех мета-символов, за исключением "$", "\" и "`". Все другие мета-символы будут выводиться буквально, причем даже одиночные кавычки будут выводиться именно в виде одиночных кавычек. Если нужно вывести символ двойной кавычки, то его нужно экранировать с помощью символа обратного слеша.

Пример:

```bash
#!/bin/bash
# Инициализируем переменную BASH_VAR
BASH_VAR="Bash Script"
# Выводим значение переменной BASH_VAR
echo $BASH_VAR
# Выводим строку, содержащую значение переменной BASH_VAR и экранированные мета-символы "" (кавычки)
echo "It's $BASH_VAR  and \"$BASH_VAR\" using backticks: `date`"
```

Вывод (указана текущая дата):

```text
Bash Script
It's Bash Script  and "Bash Script" using backticks: Вт ноя 20 07:32:25 MSK 2018
```

## Экранирование символов в стиле ANSI-C

Еще один способ экранирования символов в bash это экранирование в стиле ANSI-C. Его суть заключается в том, что при использовании обратного слеша и одного из нижеприведенных символов можно получить одно из специальных значений, например, вертикальную табуляцию, возврат каретки или символ через его шестнадцатеричный код.

```text
\a    alert (bell)
\b    backspace
\e    an escape character
\f    form feed
\n    newline
\r    carriage return
\t    horizontal tab
\v    vertical tab
\\    backslash
\`    single quote
\nnn  octal value of characters
\xnn  hexadecimal value of characters
```

Пример:

```bash
#!/bin/bash
# В этом примере мы используем:
# \n как перевод на новую строку,
# \x40 для получения символа "@" через его шестнадцатеричный код
# \056 для получения символа "." (точка) через восьмеричный код
echo $'web: www.yandex.ru\nemail: my_mail\x40yandex\056ru'
```

Вывод:

```text
web: www.yandex.ru
email: my_mail@yandex.ru
```

## Арифметические операции

В bash поддерживаются все основные арифметические операции. Для того, чтобы интерпретировать строку как арифметическое выражение, перед этой строкой ставится команда `let`. Помимо этого, существует два формата вычисления арифметических выражений: `$[ expression ]` и `$((expression))`. Оба этих формата равноправны и нет особой разницы какой из них использовать.
Также есть возможность переводить числа из двоичной, восьмеричной и шестнадцатеричной систем счисления в десятичную. Для этого используется следующий синтаксис:
`основание_системы_счисления#число_в_этой_системе_счисления`
Например, `2#10001` вернет десятичное 17.

Пример программы с арифметическими выражениями:

```bash
#!/bin/bash
echo 'Применение let'
# Сложение
let ADDITION=3+5
echo "3 + 5 =" $ADDITION
# Вычитание
let SUBTRACTION=7-8
echo "7 - 8 =" $SUBTRACTION
# Умножение
let MULTIPLICATION=5*8
echo "5 * 8 =" $MULTIPLICATION
# Деление
let DIVISION=4/2
echo "4 / 2 =" $DIVISION
# Остаток от деления
let MODULUS=9%4
echo "9 % 4 =" $MODULUS
# Возведение в степень
let POWEROFTWO=2**2
echo "2 ^ 2 =" $POWEROFTWO

# Примеры двух форматов вычисления арифметических выражений
echo 'Арифметические выражения'
echo 4 + 5 = $((4 + 5))
echo 7 - 7 = $[ 7 - 7 ]
echo 4 x 6 = $((3 * 2))
echo 6 / 3 = $((6 / 3))
echo 8 % 7 = $((8 % 7))
echo 2 ^ 8 = $[ 2 ** 8 ]

# Перевод из различных систем счисления
echo 'Системы счисления'
echo -e "Please enter two numbers \c"
# Считываем введенные пользователем числа
read num1 num2
declare -i result
result=$num1+$num2
echo "Result is: $result"
# Двоичное 10001 в десятичное
result=2#10001
echo $result
# Восьмеричное 16 в десятичное
result=8#16
echo $result
# Шестнадцатеричное 0xE6A в десятичное
result=16#E6A
echo $result
```

Вывод программы:

```text
Применение let
3 + 5 = 8
7 - 8 = -1
5 * 8 = 40
4 / 2 = 2
9 % 4 = 1
2 ^ 2 = 4
Арифметические выражения
4 + 5 = 9
7 - 7 = 0
4 x 6 = 6
6 / 3 = 2
8 % 7 = 1
2 ^ 8 = 256
Системы счисления
Введите два числа: 
24 54
Результат: 78
17
14
3690
```

## Список литературы

1. Бреснахэн, К. Linux на практике [Текст] / Бреснахэн К., Блум Р. — СПб.: Питер, 2017. — 384 с.
2. Донцов, С.В. Linux на примерах [Текст] / С.В. Донцов, И.В. Сафин. — СПб.: "Наука и техника", 2017. — 352 с.
3. Колисниченко, Д.Н. Командная строка Linux и автоматизация рутинных задач [Текст] / Д.Н. Колисниченко. — СПб.: БХВ-Петербург, 2012. — 352 с.
4. Кофлер, М. Linux. Установка, настройка, администрирование [Текст] / М. Кофлер. — СПб.: Питер, 2014. — 768 с.: ил.
5. [Основы BASH. Часть 1](https://habr.com/post/47163/) [Электронный ресурс] Дата просмотра: 17 ноября 2018
6. [Основы BASH. Часть 2](https://habr.com/post/52871/) [Электронный ресурс] Дата просмотра: 17 ноября 2018
7. [Написание скриптов на Bash](https://losst.ru/napisanie-skriptov-na-bash) [Электронный ресурс] Дата просмотра: 17 ноября 2018
8. [bash на Википедии](https://ru.wikipedia.org/wiki/Bash) [Электронный ресурс] Дата просмотра: 17 ноября 2018
9. [Bash Scripting Tutorial for Beginners](https://linuxconfig.org/bash-scripting-tutorial-for-beginners) [Электронный ресурс] Дата просмотра: 17 ноября 2018
10. [Bash scripting Tutorial](https://linuxconfig.org/bash-scripting-tutorial) [Электронный ресурс] Дата просмотра: 17 ноября 2018
