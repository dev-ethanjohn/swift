import Foundation

//MARK: structures are value types
struct Person {
    let name: String // property
    let age: Int
    
    //constructors are created by teh compiler, no need to expicitly put them, unlike in dart/flutter
}

let foo = Person(name: "Ethan John", age: 24) // instantiation
foo.name
foo.age //access
print("I am \(foo.age) years old and my name is \(foo.name)")


// -----------------------------------------------------

//MARK: With custom cuonstructor
struct CommodoreComputer {
    let name: String
    let manufacturer: String
   // let manufacturer: String = "Commodore" //This is also ork the same to omit the init
    
    init(name: String) { //Constructor
        self.name = name
        // we can explicitly put here the default value if we know this property value is always the same when we create an instance
        self.manufacturer = "Commodore"
    }
}


let c64 = CommodoreComputer(name: "My Commodore")
let c128 = CommodoreComputer(name: "My Commodore 128")
c128.manufacturer


//MARK: With computed properties
struct Person2 {
    let firstName: String
    let lastName: String
    var fullName: String { // computed properties
        "\(firstName) \(lastName)"
    }
}

let person2 = Person2(firstName: "Ethan John", lastName: "Paguntalan")
print(person2.fullName)



//Function that can mutate a structure
struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) { // we change this to make it mutable
        "Driving..."
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 10)
immutableCar.currentSpeed //immutable

var mutableCar = Car(currentSpeed: 19)
mutableCar.currentSpeed
mutableCar.drive(speed: 20) //we cahnged this
mutableCar.currentSpeed

let copy = mutableCar
copy.currentSpeed



// ------------------------------------------------
//MARK: Sturctures cannot have sub-classes
struct LivingThing {
    init() {
        "I'm a living thing"
    }
}


//struct Animal: LivingThing {
//    
//} ❌ sTRUCTURES CANNOT INHERIT from each other


//MARKL: Custom copying of structures
struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        // create a new bike instance
        // - the same manufacturer as the orig
        // - potentially diff currentspeed
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
let bike2 = bike1.copy(currentSpeed: 30) // we assigned it a new value
bike1.currentSpeed
bike2.currentSpeed


let bike3 = Bike(manufacturer: bike1.manufacturer, currentSpeed: 30)
bike3.currentSpeed //THE SAME AS bike2 when we copy




//MARK: REAL WORLD EX
struct Motor {
    let manufacturer: String
    let currentSpeed: Int
    //flexible
    /**
     This version uses optional parameters with default values (?? self.manufacturer and ?? self.currentSpeed) allowing the caller to selectively override the values. If no new value is provided, the original value is retained. This adds flexibility without making the function call more complicated.
     */
    func copy(manufacturer: String? = nil, currentSpeed: Int? = nil) -> Bike {
        Bike(manufacturer: manufacturer ?? self.manufacturer, currentSpeed: currentSpeed ?? self.currentSpeed)
    }
}

// Create an initial bike
let motor1 = Motor(manufacturer: "Harley-Davidson", currentSpeed: 60)

// Create a copy with the same manufacturer but different speed
let motor2 = motor1.copy(currentSpeed: 70)
print("Motor 2: \(motor2.manufacturer), \(motor2.currentSpeed)") // Output: Bike 2: Harley-Davidson, 70

// Create a copy with a different manufacturer and speed
let motor3 = motor1.copy(manufacturer: "Triumph", currentSpeed: 50)
print("Motor 3: \(motor3.manufacturer), \(motor3.currentSpeed)") // Output: Bike 3: Triumph, 50

// Create a copy with only the manufacturer changed.
let motor4 = motor1.copy(manufacturer: "Ducati")
print("Motor 4: \(motor4.manufacturer), \(motor4.currentSpeed)") // Output: Bike 4: Ducati, 60

// Create a copy with no changes (using default optional parameters)
let motor5 = motor1.copy()
print("Motor 5: \(motor5.manufacturer), \(motor5.currentSpeed)") // Output: Bike 5: Harley-Davidson, 60
