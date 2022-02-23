import Foundation

//решение квадратных уравнений

//создание констант
let a:Double = 2
let b:Double = 9
let c:Double = 7
//создание переменных для расчетов
var x1:Double = 0
var x2:Double = 0
var D:Double = 0

//вычисление дискриминанта
D = b * b - 4 * a * c


//проверки дискриминанта
if (D > 0){
    x1 = (-b + sqrt(D))/(2*a)
    x2 = (-b - sqrt(D))/(2*a)
    print("X1 =",x1," X2 =",x2)
}else if (D == 0){
    x1 = (-b)/(2*a)
    print("Один корень X=", x1)
}else{
    print("Уравнение не имеет корней")
}

//
//
//
//
//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

//ABC треугольник
//Задаем константы катетов bc,ac
let bc:Float = 12
let ac:Float = 9


//Гипотенуза тиорема Пифагора

var ab:Float = sqrt((ac * ac) + (bc * bc))
print ("Гипотенуза равна",ab)

//Площадь треугольника по формуле Герона
var p = (bc + ac + ab)/2
var S:Float = sqrt(p*(p-bc)*(p-ac)*(p-ab))
print ("Площадь =",S)

//Приметр треугольника. Полупериметр умножаем на 2
var P = p * 2
print ("Периметр =",P)


//
//
//
//
//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через                             5 лет.

//расчет процентов депозита с ежемесячной капитализацией процентов

let sum:Double = 1000000
let rate:Double = 9.39
let durationInYear:Double = 1

var finalSum: Double = sum * pow((1+((rate/100)/12)), durationInYear*12)

print ("Сумма в конце заданого периода", round(finalSum))

