import UIKit

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

//параметры автомобиля
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

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

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


struct Auto {
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

struct SportCar {
    let brand: String
    let year: Int
    let color: UIColor
    let transmission: Transmission
    let km: Double
    let veelsDrive: VeelsDrive
    let maxSpeed: Int
    let acceleration: Double
    let weight: Double
    let dragСoefficient: Double
    let housePower: Int
    let fuel: Fuel
    let trunkVolume: Double
    var filledTrunkVolume: Double
    var windowsState: WindowsState
    var engineState: Bool
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

struct TrunkCar {
    let brand: String
    let year: Int
    let color: UIColor
    let veelsDrive: VeelsDrive
    let loadCapacity: Double
    let housePower: Int
    let trailer: Bool
    let powerReserve: Int
    let fuel: Fuel
    let trunkVolume: Double
    var filledTrunkVolume: Double
    var windowsState: WindowsState
    var engineState: Bool
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

var car1 = Auto(brand: "Opel", year: 2000, color: .black, mp3: true, transmission: .auto, km: 120, centralLocking: true, veelsDrive: .front, fuel: .gas, trunkVolume: 2, filledTrunkVolume: 2, windowsState: .close, engineState: true)

var car2 = SportCar(brand: "Bugatti", year: 2022, color: .blue, transmission: .auto, km: 15, veelsDrive: .full, maxSpeed: 400, acceleration: 2, weight: 1200, dragСoefficient: 1.0, housePower: 600, fuel: .oil, trunkVolume: 0.2, filledTrunkVolume: 0, windowsState: .close, engineState: true)

var car3 = TrunkCar(brand: "Volvo", year: 2021, color: .blue, veelsDrive: .rear, loadCapacity: 80, housePower: 450, trailer: false, powerReserve: 1000, fuel: .diesel, trunkVolume: 80, filledTrunkVolume: 74, windowsState: .open, engineState: false)




car1.Trunk(action: .pull, volume: 100)
car2.Window(run: true)
car3.Engine(run: true)

print(car1.filledTrunkVolume)
print(car2.windowsState)
print(car3.engineState)

print("Машина:\n",car1)
print("Спорт кар:\n",car2)
print("Грузовик:\n",car3)

