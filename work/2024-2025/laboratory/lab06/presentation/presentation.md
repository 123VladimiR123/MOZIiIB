---
## Front matter
lang: ru-RU
title: Лабораторная работа №6
subtitle: Разложение чисел на множители
author:
  - Кубасов В.Ю.

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}

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
---

# Вводная часть

## Актуальность

- Разложение чисел занимает достаточно много времени при условии используемых в шифровании порядков. Однако помимо перебора существуют алгоритмы, оптимизирующие данный процесс.


## Цели и задачи

Реализовать алгоритмы:    
- Алгоритм реализующий p-метод Полларда

# Выполнение работы

## Нахождение НОД по Евклиду:

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

## Нахождение нетривиальног множителя

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

- В ходе лабораторной работы реализовали вероятностные алгоритмы определения числа на простоту
