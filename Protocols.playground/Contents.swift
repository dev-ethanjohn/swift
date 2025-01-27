import Foundation

protocol CanBreathe {
    //any object that can breath should have a function with `breathe()`
    func breathe() //we can have functions without implemenattion in protocols
}

struct Animal: CanBreathe {
    func breathe() {
        "Animal breathing ...."
    }
}


struct Person: CanBreathe {
    func breathe() {
        "Person breathing...."
    }
}

let dog = Animal()
print(dog.breathe())

let ethan = Person()
ethan.breathe()



//MARK: aDD implmenattion to the protocol function by using an extension
protocol CanJump {
    func jump()
}

//default imlmennation
extension CanJump {
    func jump() {
        "Jumping"
    }
}

struct Cat: CanJump {
}

let whiskers = Cat()
whiskers.jump()



//MARK:

protocol HasName {
    var name: String { get } // some sort of vairable that i can read from
    var age: Int { get set }
}

extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }
    
    mutating func increaseAge() {
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

var woof = Dog(name: "Woof", age: 2)
woof.name
woof.age
woof.age += 1
woof.age
woof.describeMe()
woof.increaseAge()
woof.age



// -------
protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int = 0
    
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed


// ----------------------
//Check if an object conforms to a protocol
func describe(obj: Any) {
    if obj is Vehicle {
        "obj conforms to the Vehicle protocol"
    } else {
        "obj does not conform to the Vehicle protocol"
    }
}

describe(obj: bike)


// ----------------------------------------------
// Prmote the obj to a Type

func increaseSpeedIfVehicle(obj: Any) {
    if var vehicle = obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 10)
        vehicle.speed
    } else {
        "tHIS WAS NOT A vehicle"
    }
}

increaseSpeedIfVehicle(obj: bike)
bike.speed // 10 (bike is a struct here so it create its own copy, that is why it remains 10. If the bike is class, then it will go 20. referenced

