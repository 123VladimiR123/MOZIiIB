---
## Front matter
title: "Лабораторная работа №4"
subtitle: "Вычисление наибольшего общего делителя"
author: "Кубасов В.Ю."

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
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

# Цель работы

Реализовать предложенные вариации алгоритма Евклида

# Задание

Реализовать: 
- Алгоритм Евклида
- Бинарный алгоритм Евклида
- Расширенный алгоритм Евклида
- Расширенный бинарный алгоритм Евклида

# Теоретическое введение

Алгоритм Евклида в различных его вариациях - способ нахождения НОДа нескольких чисел. Его роль в криптографии определяется вычислением закрытых ключей в различных алогритмах шифрования. Так, например, алгоритм Евклида используется[@косс2023применение] в RSA для вычисления закрытого ключа.    
Данный алгоритм - способ вычисления НОДа за приемлемые[@абрамов1979некоторые] количество итераций и время.

# Выполнение лабораторной работы    

## Алгоритм Евклида

По предложенному алгоритму был выполнен следующий код:
```julia
ri_1 = a; ri = b; i = 1;

while (true) 
    riplus1 = ri_1 % ri;
    if (riplus1 == 0)
        break;
    end;
    ri_1 = ri;
    ri = riplus1;
end;
```

где ri_1 - r<sub>i - 1</sub>,  ri - r<sub>i</sub>, riplus1 - r<sub>i + 1</sub>

## Бинарный Евклида

По предложенному алгоритму был выполнен следующий код:
```julia
while ((a % 2 == 0) && (b % 2 == 0))
    a /= 2;
    b /= 2;
    g *= 2;
end;

u = a;
v = b;

while (u % 2 == 0)
    u /= 2;
end;

while (v % 2 == 0)
    v /= 2;
end;

while (u != 0)
    if (u >= v)
        u = u - v;
    else
        v = v - u;
    end;
end;
```

Обозначения соответствуют предыдущему пункту. Данный алгоритм устраняет излишние вычисления при четности чисел.

## Расширенный алгоритм Евклида

По предложенному алгоритму был выполнен следующий код:
```julia

ri_1 = a; ri = b; i = 1;
xi_1 = 1; xi = 0;
yi_1 = 0; yi = 1;

while (true) 
    riplus1 = ri_1 % ri;
    q = (ri_1 - riplus1) / ri;
    xiplus1 = xi_1 - q * xi;
    yiplus1 = yi_1 - q * yi;
    if (riplus1 == 0)
        break;
    end;
    ri_1 = ri;
    ri = riplus1;
    xi_1 = xi;
    xi = xiplus1;
    yi_1 = yi;
    yi = yiplus1;
    
end;
```
Данный алгортим дополняет стандартный евклидовский разложением на множители.

## Расширенный алгоритм Евклида

По предложенному алгоритму был выполнен следующий код:
```julia

while ((a % 2 == 0) && (b % 2 == 0))
    a /= 2;
    b /= 2;
    g *= 2;
end;


u = a; v = b;
As = 1; Bs = 0; C = 0; D = 1;

while (u % 2 == 0)
    u /= 2;
    if ((As % 2 == 0) && (Bs % 2 == 0))
        As /= 2;
        Bs /= 2;
    else
        As += b; As /= 2;
        Bs -= a; Bs /= 2;
    end;
end;

while (v % 2 == 0)
    v /= 2;
    if ((C % 2 == 0) && (D % 2 == 0))
        C /= 2;
        D /= 2;
    else
        C += b; C /= 2;
        D -= a; D /= 2;
    end;
end;

if (u >= v) 
    u =- v;
    As -= C;
    Bs -= D;
else
    v -= u;
    C -= As;
    D -= Bs;
end;
```
Данный алгортим дополняет бинарный алгоритм евклида разложением на множители.

# Выводы

Реализовали по предложенным алгоритмическим описаниям:
- Алгоритм Евклида
- Бинарный алгоритм Евклида
- Расширенный алгоритм Евклида
- Расширенный бинарный алгоритм Евклида

# Список литературы{.unnumbered}

::: {#refs}
:::
