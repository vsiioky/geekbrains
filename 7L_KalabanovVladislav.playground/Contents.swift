enum BusError:Error{
    case noPlace
    case noPassenger
    case muchMoney
    case fewMoney
}

//создаем класс Bus
class Bus {
    var package: String
    var price: UInt
    var seat: UInt
    var occupied: UInt
    var paySum :UInt = 0
    init(package: String, price: UInt, seat: UInt, occupied: UInt){
        self.package = package
        self.price = price
        self.seat = seat
        self.occupied = occupied
    }
    //Добавить пассажира в автобус
    func popPassenger() throws -> String{
        if self.seat > self.occupied{
            self.occupied += 1
            return("Пасажир добавлен")
        } else {
            throw BusError.noPlace
        }
    }
    func pullPassenger()throws -> String{
        if self.occupied >= 1 {
            self.occupied -= 1
            return("Пассажир убран")
        }else {
            throw BusError.noPassenger
        }
    }
    //Оплатить за проезд
    func pay(money: UInt)throws -> String{
        if money == self.price {
            self.paySum += money
            return "Оплата прошла успешно"
        } else if paySum > self.price {
            throw BusError.muchMoney
        } else {
            throw BusError.fewMoney
        }
    }
}

var busA1 = Bus(package: "Busines", price: 20000, seat: 1, occupied: 0)

do {
    print(try busA1.popPassenger())
    print(try busA1.popPassenger())
}
catch BusError.noPlace{
    print("Мест нет")
}

do {
print(try busA1.pullPassenger())
print(try busA1.pullPassenger())
}
catch BusError.noPassenger{
    print("Нет пасажиров")
}

do {
print(try busA1.pay(money: 20000))
print(try busA1.pay(money: 10000))
print(try busA1.pay(money: 120000))
}
catch BusError.muchMoney{
    print("Заплатите точную сумму")
}
catch BusError.fewMoney{
    print("Недостаточно средств")
}

