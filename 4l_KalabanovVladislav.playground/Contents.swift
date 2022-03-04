//Так много свойств делаю для понимания и запониманиния )


/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
*/


import UIKit




enum VeelsDrive {
    case front, rear, full
}
enum Transmission {
    case manual, auto
}
enum Fuel{
    case oil, diesel, gas
}
enum WindowsState{
    case open, close
}

enum StartEngine {
    case start
    case stop
}

enum OpenWindow{
    case open
    case close
}

enum PutOrPull {
    case put
    case pull
}



class Car {
    let brand: String
    let year: Int
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    let km: Double
    let centralLocking: Bool
    let veelsDrive: VeelsDrive
    let fuel: Fuel
    let trunkVolume: Double
    var filledTrunkVolume: Double
    var windowsState: WindowsState
    var engineState: Bool
    
    init(brand: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, km: Double, centralLocking: Bool, veelsDrive: VeelsDrive, fuel: Fuel, trunkVolume: Double, filledTrunkVolume: Double, windowsState: WindowsState, engineState: Bool){
        self.brand = brand
        self.year = year
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.centralLocking = centralLocking
        self.veelsDrive = veelsDrive
        self.fuel = fuel
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        self.windowsState = windowsState
        self.engineState = engineState
    }
    
    func Engine (run:Bool){
        switch run {
        case true: self.engineState = true
            case false: self.engineState = false
        }
        }
    func Window (run: Bool) {
        switch run {
        case true: self.windowsState = .open
        case false: self.windowsState = .close
        }
    }
    func Trunk (action: PutOrPull, volume: Double){
        let availableVolume:Double
        if action == .put {
            availableVolume = trunkVolume - filledTrunkVolume
            if availableVolume >= volume {
                self.filledTrunkVolume = self.filledTrunkVolume + volume
            }else{
                print ("Error объем который вы хотите погрузить больше чем свободный объем багажника")
            }
        }else{
            if self.filledTrunkVolume >= volume {
                self.filledTrunkVolume = self.filledTrunkVolume - volume
            }else {
                print("Error нет того объема который вы хотите изъять")
            }
        }
    }
    
    
}

enum Boost{
    case min
    case average
    case max
}
class SportCar:Car{
    let maxSpeed: Int
    let acceleration: Double
    let weight: Double
    let dragСoefficient: Double
    let housePower: Int
    let boost: Boost
    init(brand: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, km: Double, centralLocking: Bool, veelsDrive: VeelsDrive, fuel: Fuel, trunkVolume: Double, filledTrunkVolume: Double, windowsState: WindowsState, engineState: Bool, maxSpeed: Int, acceleration: Double, weight: Double, dragСoefficient: Double, housePower: Int, boost: Boost) {
        self.maxSpeed = maxSpeed
        self.acceleration = acceleration
        self.weight = weight
        self.dragСoefficient = dragСoefficient
        self.housePower = housePower
        self.boost = boost
        super.init(brand: brand, year: year, color: color, mp3: mp3, transmission: transmission, km: km, centralLocking: centralLocking, veelsDrive: veelsDrive, fuel: fuel, trunkVolume: trunkVolume, filledTrunkVolume: filledTrunkVolume, windowsState: windowsState, engineState: engineState)
    }
    
    override func Engine(run: Bool) {
        switch run{
        case true:
            self.engineState = true
            print("Будьте аккуратны на дорогах общего пользования")
        case false: self.engineState = false
        }
    }
}



enum AirSuspension{
    case up
    case down
}

class TrunkCar:Car {
    let loadCapacity: Double
    let horsePower: Int
    let powerReserve: Int
    let airSuspension: AirSuspension
    let trailerVolume: Double
    var filledTrailerVolume: Double
    init(brand: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, km: Double, centralLocking: Bool, veelsDrive: VeelsDrive, fuel: Fuel, trunkVolume: Double, filledTrunkVolume: Double, trailerVolume: Double, filledTrailerVolume: Double, windowsState: WindowsState, engineState: Bool, loadCapacity: Double, horsePower: Int, powerReserve: Int, airSuspension: AirSuspension) {
        self.loadCapacity = loadCapacity
        self.horsePower = horsePower
        self.powerReserve = powerReserve
        self.airSuspension = airSuspension
        self.trailerVolume = trailerVolume
        self.filledTrailerVolume = filledTrailerVolume
        super.init(brand: brand, year: year, color: color, mp3: mp3, transmission: transmission, km: km, centralLocking: centralLocking, veelsDrive: veelsDrive, fuel: fuel, trunkVolume: trunkVolume, filledTrunkVolume: filledTrunkVolume, windowsState: windowsState, engineState: engineState)
    }
    override func Trunk(action: PutOrPull,volume: Double){
        let availableVolume:Double
        if action == .put {
            availableVolume = trailerVolume - filledTrailerVolume
            if availableVolume >= volume {
                filledTrailerVolume = filledTrailerVolume + volume
            }else{
                print ("Error объем который вы хотите погрузить больше чем свободный объем прицепа")
            }
        }else{
            if self.filledTrailerVolume >= volume {
                self.filledTrailerVolume = self.filledTrailerVolume - volume
            }else {
                print("Error нет того объема в прицепе который вы хотите изъять")
            }
        }
    }
    }



var porshe = SportCar(brand: "Porshe", year: 2020, color: .red, mp3: true, transmission: .manual, km: 0, centralLocking: true, veelsDrive: .full, fuel: .oil, trunkVolume: 1, filledTrunkVolume: 0, windowsState: .close, engineState: true, maxSpeed: 350, acceleration: 1.5, weight: 1400, dragСoefficient: 1, housePower: 400, boost: .average)
 
var KAMAZ = TrunkCar(brand: "KAMAZ", year: 2022, color: .cyan, mp3: true, transmission: .auto, km: 100000, centralLocking: true, veelsDrive: .full, fuel: .diesel, trunkVolume: 100, filledTrunkVolume: 10, trailerVolume: 1000, filledTrailerVolume: 100, windowsState: .close, engineState: false, loadCapacity: 1000, horsePower: 450, powerReserve: 1000, airSuspension: .up)




porshe.Window(run: true)
KAMAZ.Engine(run: true)

porshe.Engine(run: true)
KAMAZ.Trunk(action: .pull, volume: 101)



extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузовик - Марка: \(self.brand);  Год выпуска: \(year); Грузоподъемность: \(loadCapacity) кг; Загружено \(filledTrailerVolume) кг"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спорткар - Марка: \(brand);  Год выпуска: \(year)г.; Разгон: \(acceleration)с до 100"
    }
}



print (porshe)
print (KAMAZ)
