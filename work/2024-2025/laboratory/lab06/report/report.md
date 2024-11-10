---
## Front matter
title: "Лабораторная работа №6"
subtitle: "Разложение чисел на множители"
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

Реализовать алгоритм по нахождению нетривиального множителя для заданного числа

# Задание

Реализовать алгоритмы:    
- Алгоритм реализующий p-метод Полларда

# Теоретическое введение

Еще одним вариантом достоверно определить простоту числа - найти для него нетривиальный множитель. Разложение чисел занимает достаточно много времени при условии используемых в шифровании порядков. Однако помимо перебора существуют алгоритмы, оптимизирующие[@климина2011оптимизация] данный процесс.

# Выполнение лабораторной работы    

## Нахождение НОД

```julia
function euklid(a, b)
    if (a == 0)
        return 1;
    end;
    ri_1 = a; ri = b; i = 1;
    while (true) 
        riplus1 = ri_1 % ri;
        if (riplus1 == 0)
            break;
        end;
        ri_1 = ri;
        ri = riplus1;
    end;
    return ri;
end;

```

## Алгоритм Полларда

```julia
function pollard(n, c, func)
    a = c;
    b = c;
    while(true)
        a = func(a) % n;
        b = func(func(b) % n) % n;
        d = euklid(a - b, n);
        if (1 < d && d < n)
            return d;
        end;
        if (d == n)
            println("Делитель не найден");
            return -1;
        end;
    end;
end;
```

# Выводы:    

- В ходе работы реализовали алгоритм оптимального нахождения нетривиальных делителей

# Список литературы{.unnumbered}

::: {#refs}
:::
