---
## Front matter
title: "Лабораторная работа №5"
subtitle: "Вероятностные алгоритмы проверки чисел на простоту"
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

Реализовать предложенные вероятностные алгоритмы

# Задание

Реализовать алгоритмы:    
- тест Ферма
- символ якоби
- тест Соловэя-Штрассена
- тест Миллера-Рабина
# Теоретическое введение

Ввиду возросшего интереса к простым числам и несуществования алгоритма с приемлемой[@коломийцева2019сравнительный   ] временной сложностью для разложения чисел на простые применяются вероятностные алгоритмы, которые в значительно меньшее число итераций позволяют оценить вероятность "простоты" числа.
Самый используемый в современности - алгоритм Миллера-Рабина[@бердимуратов2023алгоритм].

# Выполнение лабораторной работы    

## Тест Ферма    

```julia
println("Введите n");
n = parse(Int, chomp(readline()));

a = rand(2:n-2);

r = a ^ (n - 1) % n;
if (r == 1)
    println("Число, вероятно, простое");
else
    println("Число составное");
end;
```

## Определения числа Якоби

```julia
function jackobi(n, a, g = 1)
    if (a == 1)
        return 0;
    end;
    if (a == 1)
        return g;
    end;
    k = 0;
    a1 = a;
    while (a1 % 2 == 0)
        a1 /= 2;
        k += 1;
    end;

    s = 0;
    if ((k % 2 == 0) || (abs(n % 8) == 1))
        s = 1;
    elseif (abs(n % 8) == 3)
        s = -1
    end;

    if (a1 == 1)
        return g * s;
    end;

    if ((n % 4 == 3) && (a1 % 4 == 3))
        s = -s;
    end;

    return jackobi(a1, n % a1, g * s);        
end

println(jackobi(91, 15));
```

## Тест Соловэя-Штрассена

```julia
println("Введите n");
n = parse(Int, chomp(readline()));

a = rand(2:n-2);

r = a ^ (n - 1) % 2;

if ((r != 1) && (r != n - 1))
    println("Число n составное");
else

    s = jackobi(n, a);
    
    if (r % n == s)
        println("Число n составное");
    else 
        println("Число, вероятно, простое");
    end;

end;
```

## Тест Миллера-Рабина

```julia
function miller()
    println("Введите n");
    n = parse(Int, chomp(readline()));
    
    n_1 = n - 1;
    s = 0;
    
    while (n_1 % 2 == 0)
        n_1 /= 2;
        s += 1;
    end;
    
    r = n_1;
    
    a = rand(2:n-2);
    y = a^r % n;
    
    j = 1;
    while (y != 1 && y != n - 1)
        if ((j <= s - 1) && (y != n - 1))
            y = y ^ 2 % n;
            if (y == 1)
                println("Число n составное");
                return 0;
                break;
            end;
            j += 1;
        end;
    
        if (y != n - 1)
            println("Число n составное");
            return 0;
            break;
        end;
    end;
    
    println("Число n, вероятно, простое")
end;

miller();
```

# Выводы:    

- В ходе лабораторной работы реализовали вероятностные алгоритмы определения числа на простоту

# Список литературы{.unnumbered}

::: {#refs}
:::
