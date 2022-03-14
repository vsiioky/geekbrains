/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести сами объекты в консоль.
 */

import UIKit
import CoreGraphics

enum Transmission {
    case manual, auto
}
enum VeelsDrive {
    case front, rear, full
}
enum Fuel{
    case oil, diesel, gas
}
enum WindowsState{
    case open, close
}
enum PutOrPull {
    case put
    case pull
}
enum AirSuspension{
    case up
    case down
}
enum Boost{
    case min
    case average
    case max
}
protocol Car {
    var brand: String {get set}
    var year: Int {get set}
    var color: UIColor {get set}
    var mp3: Bool {get set}
    var transmission: Transmission {get set}
    var km: Double {get set}
    var centralLocking: Bool {get set}
    var veelsDrive: VeelsDrive {get set}
    var fuel: Fuel {get set}
    var trunkVolume: Double {get set}
    var filledTrunkVolume: Double {get set}
    var windowsState: WindowsState {get set}
    var engineState: Bool {get set}
}
extension Car {
    mutating func Engine (run:Bool){
        switch run {
        case true: self.engineState = true
            case false: self.engineState = false
        }
        }
    mutating func Window (run: Bool) {
        switch run {
        case true: self.windowsState = .open
        case false: self.windowsState = .close
        }
    }
    mutating func Trunk (action: PutOrPull, volume: Double){
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


protocol TrunkCar: Car{
    var loadCapacity: Double {get set}
    var horsePower: Int {get set}
    var powerReserve: Int {get set}
    var airSuspension: AirSuspension {get set}
    var trailerVolume: Double {get set}
    var filledTrailerVolume: Double {get set}
}

extension TrunkCar{
    mutating func Trunk(action: PutOrPull,volume: Double){
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

protocol SportCar:Car{
    var maxSpeed: Int {get set}
    var acceleration: Double {get set}
    var weight: Double {get set}
    var dragСoefficient: Double {get set}
    var housePower: Int {get set}
    var boost: Boost {get set}
}

extension SportCar {
    mutating func Engine(run: Bool) {
        switch run{
        case true:
            self.engineState = true
            print("Будьте аккуратны на дорогах общего пользования")
        case false: self.engineState = false
        }
    }
}

class SportCar1:SportCar&CustomStringConvertible {
    var description: String {
        return "Спорткар - Марка: \(brand);  Год выпуска: \(year)г.; Разгон: \(acceleration)с до 100"}
    
    var maxSpeed: Int
    var acceleration: Double
    var weight: Double
    var dragСoefficient: Double
    var housePower: Int
    var boost: Boost
    var brand: String
    var year: Int
    var color: UIColor
    var mp3: Bool
    var transmission: Transmission
    var km: Double
    var centralLocking: Bool
    var veelsDrive: VeelsDrive
    var fuel: Fuel
    var trunkVolume: Double
    var filledTrunkVolume: Double
    var windowsState: WindowsState
    var engineState: Bool
    
    init(brand: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, km: Double, centralLocking: Bool, veelsDrive: VeelsDrive, fuel: Fuel, trunkVolume: Double, filledTrunkVolume: Double, windowsState: WindowsState, engineState: Bool, maxSpeed: Int, acceleration: Double, weight: Double, dragСoefficient: Double, housePower: Int, boost: Boost){
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
        self.maxSpeed = maxSpeed
        self.acceleration = acceleration
        self.weight = weight
        self.dragСoefficient = dragСoefficient
        self.housePower = housePower
        self.boost = boost
    }
}

class TrunkCar1: Car {
    var brand: String
    var year: Int
    var color: UIColor
    var mp3: Bool
    var transmission: Transmission
    var km: Double
    var centralLocking: Bool
    var veelsDrive: VeelsDrive
    var fuel: Fuel
    var trunkVolume: Double
    var filledTrunkVolume: Double
    var windowsState: WindowsState
    var engineState: Bool
    var loadCapacity: Double
    let horsePower: Int
    let powerReserve: Int
    let airSuspension: AirSuspension
    var trailerVolume: Double
    var filledTrailerVolume: Double
    
    init(brand: String, year: Int, color: UIColor, mp3: Bool, transmission: Transmission, km: Double, centralLocking: Bool, veelsDrive: VeelsDrive, fuel: Fuel, trunkVolume: Double, filledTrunkVolume: Double, trailerVolume: Double, filledTrailerVolume: Double, windowsState: WindowsState, engineState: Bool, loadCapacity: Double, horsePower: Int, powerReserve: Int, airSuspension: AirSuspension)
    {
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
        self.trailerVolume = trailerVolume
        self.loadCapacity = loadCapacity
        self.horsePower = horsePower
        self.powerReserve = powerReserve
        self.airSuspension = airSuspension
        self.trailerVolume = trailerVolume
        self.filledTrailerVolume = filledTrailerVolume
        self.windowsState = windowsState
        self.engineState = engineState
    }
}

extension TrunkCar1:CustomStringConvertible {
    var description: String {
        return "Грузовик - Марка: \(self.brand);  Год выпуска: \(year); Грузоподъемность: \(loadCapacity) кг; Загружено \(filledTrailerVolume) кг"
    }
}

var car12 = SportCar1(brand: "mazda", year: 2020, color: .blue, mp3: true, transmission: .auto, km: 200, centralLocking: true, veelsDrive: .full, fuel: .oil, trunkVolume: 4, filledTrunkVolume: 0, windowsState: .close, engineState: true, maxSpeed: 500, acceleration: 2, weight: 1500, dragСoefficient: 1, housePower: 1000, boost: .max)

var carTrunk = TrunkCar1(brand: "KAMAZ", year: 2022, color: .cyan, mp3: true, transmission: .auto, km: 100000, centralLocking: true, veelsDrive: .full, fuel: .diesel, trunkVolume: 100, filledTrunkVolume: 10, trailerVolume: 1000, filledTrailerVolume: 100, windowsState: .close, engineState: false, loadCapacity: 1000, horsePower: 450, powerReserve: 1000, airSuspension: .up)


car12.Engine(run: true)
car12.Trunk(action: .pull, volume: 1)
car12.Window(run: false)

carTrunk.Engine(run: false)
carTrunk.Trunk(action: .pull, volume: 10)
carTrunk.Window(run: false)

print(car12)
print (carTrunk)
