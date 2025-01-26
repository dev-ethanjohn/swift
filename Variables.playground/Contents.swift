import Foundation

//MARK: IMPORTANT!
/// let declares a constant, so the value cannot be reassigned to a new value. But, if we have reference types, let only prevents reassignment of the reference, - not mutate on the object's internal state.


//let - cannot be assigned to again
let myName = "Ethan John"
//var - can be assigned to again
let yourName = "Elon"

//arrays are structures, well? in swift
var names = [
    myName,
    yourName
]

names = ["Bla"] // mutating the array internally (creating new array)
names.append("Nick")
names.append("Clint")

//--------------------------------------------------------

let foo = "Foo"
var foo2 = foo

foo2 = "Foo 2" //assigning a new value

foo // not assigned so no change + still holds its original value
foo2 // we assigned it so it changed to "Foo 2"
//MARK: We have 2 foos - independent copies inside memory (value types)

//MARK: VALUE TYPES - String, Int, Bool, Array, etc)
//each instance hold its own copy of the data
// assigning a value type (string, int, bool, array) to a variable or constant, a copy of that value is made, meaning that chanes to one avriable do not affect the other
// Changing foo2 does not affect foo because they are separate instances in memory.


let moreNames = [
    "Foo",
    "Bar"
]

var copy = moreNames
copy.append("Bazz")

moreNames
copy

// -------------------------------------------------------
//objectiveC

//Using referece type classes like NSMutableArray ignores let, thus it can mutate
let oldArray = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)

oldArray.add("Baz") // it changed internally
var newArray = oldArray
newArray.add("Wuz")

let someNames = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)
func changeTheArray(_ array: NSArray) { //this function changes the original copy
    let copy = array as! NSMutableArray //bad code
    copy.add("Baz")
}

changeTheArray(someNames)
someNames


// --------------------------------------------------
//MARK: Using let with a Reference Type (Class)
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

//declare a constant reference to a Person object
let person = Person(name: "Ethan John")

person.name = "Elon Musk" // can mutate the object's properties even though `person` is let
//person = Person(name: "Tim Cook") ❌ error! (let prevents reassignment, but not mutation when dealing w/ reference types


//MARK: Using function/closure (Ref)
let greet: () -> Void = {
    print("Hello World!")
}

// greet = { print("Goodbye!") } // ❌ Error: `let` prevents reassignment.

greet() // ✅ Works! Calls the original closure.


//MARK: Struct (VALUE TYPE)
struct Point {
    var x: Int
    var y: Int
}

let point = Point(x: 10, y: 20)
// point.x = 30 // ❌ Error: `let` makes value types fully immutable.
