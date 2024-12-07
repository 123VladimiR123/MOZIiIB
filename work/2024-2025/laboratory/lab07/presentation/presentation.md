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

- Нахождение логарфима - времязатратный процесс. Необходим алгоритм дискретного быстрого нахождения логарифма


## Цели и задачи

Реализовать алгоритмы:    
- Алгоритм реализующий p-метод Полларда

# Выполнение работы

## Нахождение логарифма по методу Полларда:

```python
from random import randint
from sympy import mod_inverse

def f(x, a, b, p):
    if x % 3 == 0:
        return (x + 1) % p
    elif x % 3 == 1:
        return (a * x) % p
    else:
        return (b * x) % p
```

## Нахождение логарифма по методу Полларда:

```python
def pollard(a, b, p):
    u, v = randint(0, p - 1), randint(0, p - 1)
    c = pow(a, u, p) * pow(b, v, p) % p
    d = c
    
    u1, v1 = u, v
    u2, v2 = u, v
    
    for i in range(100_000_000):
        c = f(c, a, b, p)
        d = f(c, a, b, p)
        
        if c % 3 == 0:
            u1 = (u1 + 1) % (p - 1)
        elif c % 3 == 1:
            v1 = (v1 + 1) % (p - 1)
            
        if d % 3 == 0:
            u2 = (u2 + 1) % (p - 1)
        elif d % 3 == 1:
            v2 = (v2 + 1) % (p - 1)
            
        if c == d:
            num = (u1 - u2) % (p - 1)
            den = (v2 - v1) % (p - 1)
            
            try:
                dev_inv = mod_inverse(den, p - 1)
                x = (num * den) % (p - 1)
                return x
            except ValueError:
                return "Решений нет"
            
    return "Решений нет"

print(pollard(10, 64, 107))
```

# Выводы:    

- В ходе лабораторной работы реализовали алгоритм нахождения дискретного логарифма
