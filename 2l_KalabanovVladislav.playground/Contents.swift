
import Foundation

//1. Написать функцию, которая определяет, четное число или нет.

func itIsEvenNumber (a:Int) -> Bool {
    let ostDel = a % 2
    let even:Bool
    if ostDel == 0 {
        even = true
        
    }else {
        even = false
    }
    return even
}

print("Число четное? ", String(itIsEvenNumber(a: 10)), "\n")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func divisionRemainder3 (a:Int) -> Bool {
    let ostDel = a % 3
    let even:Bool
    if ostDel == 0 {
        even = true
        
    }else {
        even = false
    }
    return even
}

print("Число делится на 3? ", String(divisionRemainder3(a: 15)),"\n")


//3. Создать возрастающий массив из 100 чисел.

var array100: [Int] = []

for a in 1...100{
    array100.append(a)
}

print ("Возрастающий массив из 100 чисел:",array100, "\n")


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for i in array100{
    let a:Bool = itIsEvenNumber(a: i)
    if a == false {
        array100.remove(at: array100.firstIndex(of: i)!)
    }
}
print ("Удалить все четные и числа не делящиеся на 3:", array100, "\n")

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.


func fibonachi (_ array: inout [Decimal]) {
    if array.count < 2 {
        array.append(0)
        array.append(1)
    }else {
        var fibNum: Decimal
        fibNum = array[array.count-2] + array[array.count-1]
        array.append(fibNum)
    }
}
var arrayfibonachi: [Decimal] = [0,1]

for _ in 1...98{
    fibonachi(&arrayfibonachi)
}

print ("100 чисел фибоначи :", arrayfibonachi, "\n")




//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

func divisionRemainder (a:Int, b:Int) -> Bool {
    let ostDel = a % b
    let even:Bool
    if a != b{
    if ostDel == 0 {
        even = true
        
    }else {
        even = false
    }
    
    }else {even = false}
    return even
}

//создание массива и переменной p
var p: Int = 2
var arrayNat: [Int] = []

//наполнение массива
for i in 2...100 {
    arrayNat.append(i)
}

//вычеркивание элементов из массива

for p in 2...8 {
    for i in arrayNat {
        if divisionRemainder(a: i, b: p){
            arrayNat.remove(at: arrayNat.firstIndex(of: i)!)
        }
    }
}

//вывод массива
print ("Простые числа :", arrayNat)

