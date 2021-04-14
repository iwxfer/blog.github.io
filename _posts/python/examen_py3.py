# Range1

def rangefunction(startvalue, endvalue, stepvalue):
    for i in range(startvalue, endvalue, stepvalue):
        print(i*i, end="\t")


# If
def calculateGrade(students_marks):
    # print(f"{students_marks}")
    grades = []
    for i, s in enumerate(students_marks):
        avg = sum(s) / len(s)
        # print(avg)
        if avg >= 90:
            grade = "A+"
        elif 80 <= avg < 90:
            grade = "A"
        elif 70 <= avg < 80:
            grade = "B"
        elif 60 <= avg < 70:
            grade = "C"
        elif 50 <= avg < 60:
            grade = "D"
        elif avg < 50:
            grade = "F"

        grades.append(grade)
        
    # print(grades)
    return grades

# Namespaces
def Assign(i, f, s, b):
    w = i
    x = f
    y = s
    z = b
    print(w)
    print(x)
    print(y)
    print(z)
    print(dir())

# namespaces 2
def Prompt():
    x = input("Enter a STRING:\n")
    print(x)
    print(type(x))
    

# Get Aditional info
def docstring(functionname):
    help(eval(functionname))

# String 1

def stringoperation(fn, ln, para, number):
    print(fn+number*"\n"+ln)
    print(fn+"\t"+ln)
    print(number*fn)
    print(f"The sentence is {para}")

# String 2
def resume(first, second, parent, city, phone, start, strfind, string1):
    print(first.strip().capitalize()+" "+second.strip().capitalize()+" "+parent.strip().capitalize()+" "+city.strip())
    
    if phone.isnumeric():
        print("True")
    else:
        print("True")
        
    if phone.startswith(start):
        print("True")
    else:
        print("False")
    
    total = len(first.split(strfind))+len(second.split(strfind))+len(city.split(strfind))+len(parent.split(strfind))-4
    print(total)
    
    print(string1.split())
    print(city.find(strfind))

#import 
import math

def calc(c):
    r = c/(2*math.pi)
    return round(r, 2), round(math.pi*(r**2), 2)

# int operations
def find(num1, num2, num3):
    print(f"{num1<num2 and num2>=num3} {num2<num1 and num2<=num3} {num3==num1 and num1!=num2}")

# for
def sumOfNFibonacciNumbers(n):
    fibos = []
    a,b = 0,1
    for i in range(n-1):
        a,b = b, a+b
        fibos.append(a)
    return sum(fibos)

# list 1
def List_Op(Mylist, Mylist2):
    print(Mylist)
    print(Mylist[1])
    print(Mylist[-1])
    Mylist.append(3)
    Mylist[3] = 60
    print(Mylist)
    print(f"{Mylist[1:5]}")
    Mylist.append(Mylist2)
    print(Mylist)
    Mylist.extend(Mylist2)
    print(Mylist)
    Mylist.pop()
    print(Mylist)
    print(f"{len(Mylist)}")

# set
def setOperation(seta, setb):
    seta = set(seta)
    setb = set(setb)
    r = seta | setb
    s = seta & setb
    t = seta - setb
    u = setb - seta
    v = seta.symmetric_difference(setb)
    return r, s, t, u, v, frozenset(seta)

# while
def calculateNTetrahedralNumber(startvalue, endvalue):
    x = []
    n = startvalue
    while n <= endvalue:
        x.append(int(n*(n+1)*(n+2)/6))
        n += 1
        
    return x

# int 2
def Integer_Math(Side, Radius):
    print(f"Area of Square is {round(Side*Side, 2)}")
    print(f"Volume of Cube is {round(Side*Side*Side, 2)}")
    
    print(f"Area of Circle is {round(3.14*Radius*Radius, 2)}")
    print(f"Volume of Sphere is {round(4*3.14*Radius*Radius*Radius/3, 2)}")

# float 2
def Float_fun(f1, f2, Power):
    print("#Add")
    print(f1+f2)
    print("#Subtract")
    print(f1-f2)
    print("#Multiply")
    print(f1*f2)
    print("#Divide")
    print(f2/f1)
    print("#Remainder")
    print(f1%f2)
    print("#To_The_Power_Of")
    x= f1**Power
    print(x)
    print("#Round")
    print(round(x,4))

# tab
def Escape(s1, s2, s3):
    s = s1+"\t"+s2+"\t"+s3
    print(s1+"\n"+s2+"\n"+s3)
    print(s1+"\t"+s2+"\t"+s3)
    s="Python\tRaw\nString\tConcept"
    print(s)
    print(repr(s).strip("'"))

# list 1
def sliceit(mylist):
    a = [mylist[1], mylist[2]]
    print(f"{a}")
    x1 = [i for i in range(len(mylist)) if i % 2 == 1]
    x = [mylist[i] for i in x1] 
    print(f"{x}")
    y = list(reversed(mylist[-3:]))
    print(f"{y}")

def myDict(key1, value1, key2, value2, value3, key3):
    d1 = {key1: value1}
    d2 = d1.copy()
    d2[key2] = value2
    d3 = d2.copy()
    d3[key1] = value3
    d4 = d3.copy()
    d4.pop(key3)
    print(d1)
    print(d2)
    print(d3)
    return d4

# list tuple
def tuplefunction(list1, list2, string1, n):
    tuple1 = tuple(list1)
    tuple2 = tuple(list2)
    tuplex = tuple1 + tuple2
    print(tuplex)
    
    print(tuplex[4])
    tuplez = (tuple1, tuple2)
    print(f"{tuplez}")
    print(f"{len(tuplez)}")
    
    tuplec = ((string1,))*n
    print(tuplec)
    
    print(f"{max(tuple1)}")

# range
def generateList(startvalue, endvalue):
    r = range(startvalue, endvalue+1)
    r1 = [*r]
    print(r1[0:3])
    
    r1 = [*reversed(r)]
    print(r1[:5])
    
    r3 = [x for i, x in enumerate(r) if i % 4 == 0]
    print(r3)
    
    r4 = [x for i, x in enumerate(reversed(r)) if i % 2 == 0]
    print(r4)



#!/bin/python3

import math
import os
import random
import re
import sys



#
# Complete the 'dateandtime' function below.
#
# The function accepts INTEGER val as parameter.
# The return type must be LIST.
#
import datetime

def dateandtime(val, tup):
    x = []
    if val == 1:
        a = datetime.date(tup[0], tup[1], tup[2])
        x.append(a)
        b = a.strftime("%d/%m/%Y")
        x.append(b)
    elif val == 2:
        ts = tup[0]
        a = datetime.date.fromtimestamp(ts)
        x.append(a)
    elif val == 3:
        a = datetime.time(tup[0], tup[1], tup[2])
        x.append(a)
        b = a.strftime('%I')
        x.append(b)
    elif val == 4:
        a = datetime.date(tup[0], tup[1], tup[2])
        week_day = a.strftime('%A')
        x.append(week_day)
        month_day = a.strftime('%B')
        x.append(month_day)
        year = a.strftime('%j')
        x.append(year)
    elif val == 5:
        a = datetime.datetime(tup[0], tup[1], tup[2], tup[3], tup[4], tup[5])
        x.append(b)

    return x

def stringmethod(para, special1, special2, list1, strfind):
    for ch in special1:
        word1 = para.replace(ch, '')
    nword2 = word1[0:71][::-1]
    print(nword2)
    
    x = nword2.replace(' ', '')
    str2 = special2.join(x)
    print(str2)
    
    err = False
    for w in list1:
        if w not in para:
            err = True
            break
    if not err:
        print(f"Every string in {list1} were present")
    else:    
        print(f"Every string in {list1} were not present")
        
    print(word1.split(' ')[0:20])
    
    