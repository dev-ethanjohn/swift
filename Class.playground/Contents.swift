import Foundation

//MARK: Classes are reference types
//classes requires cosntructor?

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}

let person1 = Person(name: "Ethan John", age: 24)
person1.name
person1.age
person1.increaseAge() //25

let person2 = person1 // person2 now refers to the same instance as person1

person2.age
person2.age = 26 //modify/mutate | Changing person2.age will also update person1.age because they reference the same object.

// Both person1 and person2 share the same memory location.
person1.age
person2.age


// -----------------------------------------------------
if person1 === person2 {
    "Both person point to the same memory"
} else {
    "They don't point to the same memory"
}



//MARK: Inheritance using classes which cannot be done on structs
class Vehicle { //This is the parent class
    func goVroom() {
        print("Go vroom vroom")
    }
}


class Car: Vehicle {
}

let car = Car()
car.goVroom() //here we can access the function goVroom() even if the Car class dont have implmentation inside its body



//MARK: PRIVATE sET
class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge() {
        self.age += 1 //we cant change this `age` outside this class since we use `private(set)`
    }
}

let person = Person2(age: 24)
print("Initial age: \(person.age)")

//Increase the age
person.increaseAge()
print("Age after increase: \(person.age)")

person.age
// person.age = 32 ❌ Attempting to modify age directly will result in a compiler error.



// ---------------------------------------------------
class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year:Int
    
    //DESIGNATED INITIALIZERs
//    init() { //with default
//        self.model = "X"
//        self.year = 2023
//    }
//
    
//    init(model: String, year: Int) { //it allows the user to explictly spefify the arguments on the call site
//        self.model = model
//        self.year = year
//    }
//    
//    //CONVENIENCE INIT
//    convenience init(model: String) {
//        self.init(model: model, year: 2023)
//    }
    
    //SIMPLFIED
    init(model: String, year: Int = 2023) {
        self.model = model
        self.year = year
    }
}


let car2 = Tesla(model: "Y")
car2.manufacturer
car2.model
car2.year


// Subclass with fixed initializer
class TeslaModelY: Tesla {
    init() { // No "override" since there's no init() in the superclass
        super.init(model: "Y", year: 2023) // Explicitly call the parent class initializer
    }
}


let modelY = TeslaModelY()
print(modelY.manufacturer) // Tesla
print(modelY.model)        // Y
print(modelY.year)         // 2023



// ------------------------------------------------
let fooBar = Person2(age: 24)
fooBar.age
func doSomething(with person: Person2) {
    person.increaseAge()
}

doSomething(with: fooBar) // thsi increase the age
fooBar.age


// ------------------------------------------------
//MARK: DEINITIALIZERS
class MyClass {
    init() {
        "initialized"
    }
    
    func doSomething() {
        // empty
        "Do something"
    }
    
    deinit {
        "Deinitialized"
    }
}

let myClosure = {
    let myClass = MyClass()
    myClass.doSomething()
}
myClosure()
