import Foundation

protocol Weightabe {
    var weight: Double {get set}
}
protocol Speed {
    var speed: Double {get set}
}
protocol Volume {
    var volume: Double {get set}
}

class WeldingMachine: Weightabe,Speed,Volume,Equatable {
    static func == (lhs: WeldingMachine, rhs: WeldingMachine) -> Bool {
        return lhs.speed == rhs.speed
    }
    
    var brand: String
    var weight: Double
    var speed: Double
    var volume: Double
    init (brand: String, weight: Double, speed: Double, volume: Double){
        self.brand = brand
        self.weight = weight
        self.speed = speed
        self.volume = volume
    }
}

class LoomMachine: Weightabe,Speed,Volume,Equatable {
    static func == (lhs: LoomMachine, rhs: LoomMachine) -> Bool {
        return lhs.speed == rhs.speed
    }
    
    var brand: String
    var weight: Double
    var speed: Double
    var volume: Double
    init (brand: String, weight: Double, speed: Double, volume: Double){
        self.brand = brand
        self.weight = weight
        self.speed = speed
        self.volume = volume
    }
}

struct Queue<T: Weightabe,Speed,Volume> {
    var queue: [T] = []
    
    
    subscript(indices: UInt ...) -> Double? {
        var weight = 0.0
        for index in indices {
            if index < self.queue.count{
            weight += self.queue[Int(index)].weight
            }else {
                return nil
            }
        }
        return weight
    }
        
    
    mutating func push(_ mashine: T) {
        queue.append(mashine)
    }
    mutating func pop() -> T{
        return queue.removeFirst()
    }
    
    func filter(array: [T], condition: (T) -> Bool ) -> [T] {
        var tmpArray = [T]()
        for element in array {
            if condition(element) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    mutating func remove<T:Equatable> (array: [T], condinion: (T) -> Bool){
        for element in array {
            if condinion(element) {
                self.queue.remove(at: array.firstIndex(of: element)!)
            }
        }
    }
}


var welding = Queue<WeldingMachine,WeldingMachine,WeldingMachine>()


var loom = Queue<LoomMachine,LoomMachine,LoomMachine>()

welding.push(WeldingMachine(brand: "Ресанта", weight: 2, speed: 10, volume: 1))
welding.push(WeldingMachine(brand: "IVT", weight: 3, speed: 11, volume: 2))
welding.push(WeldingMachine(brand: "PIT", weight: 4, speed: 9, volume: 2))
welding.push(WeldingMachine(brand: "Bosh", weight: 3, speed: 20, volume: 3))
welding.push(WeldingMachine(brand: "No name", weight: 20, speed: 100, volume: 21))


loom.push(LoomMachine(brand: "Jamone", weight: 1, speed: 10, volume: 3))
loom.push(LoomMachine(brand: "Elna", weight: 2, speed: 20, volume: 3))
loom.push(LoomMachine(brand: "Jaguar", weight: 3, speed: 50, volume: 4))

welding.queue
loom.queue

welding.pop()
loom.pop()

welding.queue
loom.queue


welding.filter(array: welding.queue, condition: {(element: WeldingMachine) -> Bool in
    return Int(element.weight) == 4})

welding.remove(array: welding.queue, condinion: {(element: WeldingMachine) -> Bool in return element.speed == 11})
welding.queue
welding[0,1]
loom[0,1]
loom[1]
loom[2]
loom[3]
loom[4]
loom[1,20]
loom[0,1]
