import Foundation

extension Int {
    func plusTwo() -> Int {
        // self + 2 //self refers to the current instance which is the (2)
        self //2
        return self + 2
    }
}


let two = 2.plusTwo() //the 2
two

// -----------------------------------------------------

struct Person {
    let firstName: String
    let lastName: String
    
  
}

extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(firstName: components.first ?? fullName, lastName: components.last ?? fullName)
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName

// ---------------------------------------




protocol GoesVroom {
    var vroomValue: String {
        get
    }
    
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) goes vroom!"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}


modelX.goVroom()



// ----------------------------------------------

class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}

let myDouble = MyDouble()
myDouble.value


// -------------------------------------------------
//MARK: extending existing protocols

extension GoesVroom {
    func goVroomVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!"
    }
}
modelX.goVroomVroomEvenMore()
