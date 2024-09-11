---
## Front matter
title: "Текст для выступления"
subtitle: "по теме \"Метод сжатия по Хаффману. Код Хэмминга.\""
author: "Кубасов Владимир Юрьевич"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: false # Table of contents
toc-depth: 2
lof: false # List of figures
lot: false # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Слайд актуальность

Актуальность работы в первую очередь обоснована повсеместным использованием кодирования. Для хранения большой информации или редко используемой
необходимо сжатие информации, а для передачи - сжатие и возможность проверить на ошибки информацию в ходе передачи. Чем лучше алгоритм сжатия - тем больше информации помещается на накопители, а так же уменьшается нагрузка на сеть в ходе передачи.

# Слайд Классический код Хаффмана

Достаточно точное пояснение алгоритма приведено на слайде.
Алгоритм достаточно прост: подсчитываем абсолютную частоту символов, кладём в таблицу частотности, формируем список, сортируя таблицу частотности по возрастанию частоты получаем список. Формируем дерево, где каждый новый узел имеет два дочерних, у которых значение наименьшее. Значение нового узла равно сумме значений дочерних. Левая ветвь формируется с кодом ноль, а правая с кодом единица. Получаем код для каждого символа, чем чаще встречается символ - тем меньше его код и ожидаемый результирующий размер файла.

# Слайд Алгоритм Хэмминга

Основная идея - внедрить в последовательсноть бит контрольные на позиции, по номеру равные степени двойки.
Значение контрольного бита вычисляется как единица, если количество единичных бит в зоне ответственности данного нечетно, ноль - если четно.
Далее на принимающей стороне вычисляются контрольные биты заново. Если биты не совпали, то ошибка в бите, номер которого равен сумме номеров несовпавших контрольных битов.

# Выводы

В ходе работы мы познакомились с двумя значимыми алгоритмами кодирования информации, которые используются в современном мире.