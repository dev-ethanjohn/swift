import Foundation

func noArgumentsAndNoReturnValue() {
    "I don't have anothing in here"
}

noArgumentsAndNoReturnValue()


func plusTwo(value: Int) {
    let newValue = value + 2
    print(newValue)
}

plusTwo(value: 30)


//MARK: with parameter and return type
func newPlusTwo(value: Int) -> Int {
    value + 2 // it return int 32 implicitly
}

newPlusTwo(value: 30)


//MARK: with/ external param and internal param
func customAdd(outside inside: Int, value2: Int) -> Int {
    return inside + value2
}

let customAdded = customAdd(outside: 10, value2: 2)


//MARK: with internal but no extenal param
func customMinus(_ lhs: Int, _ rhs: Int) -> Int {
    lhs - rhs
}

let customSubstracted = customMinus(12, 12)



@discardableResult //Add this if we wont be using the returned value any thereafter . In swift not in playground, we have to assign the callback function to a new constant or variable and the same case for the former
func myCustomAdd(_ lhs: Int, rhs: Int) -> Int {
    lhs + rhs
}


//IN SWIFT
@discardableResult
func logMessage(_ message: String) -> Int {
    print(message)
    return message.count
}

logMessage("Hello, World!") // No warning, even though the return value is ignored.

let length = logMessage("Hello, Swift!") // Use the return value if needed.
print(length) // Output: 13



//MARK: FUNCTION CONATINING OTHER FUNCTIONS
func doSomethingComplicated(with value: Int) -> Int { //value = 30
    func mainLogic(value: Int) -> Int { // value = 33
        value + 2
    }
    
    return mainLogic(value: value + 3)
}

let result = doSomethingComplicated(with: 30)
print(result) // Output: 35


//MARK: WITH DEFAULT value
func getFullName(firstName: String = "Ethan", lastName: String = "Paguntalan") -> String {
    "\(firstName) \(lastName)"
}

getFullName()
getFullName(firstName: "Baz")
getFullName(lastName: "Foo")
getFullName(firstName: "A", lastName: "B")



