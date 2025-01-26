import Foundation

let myAge = 22
let yourAge = 20

if myAge > yourAge {
    "I am older than you :)"
} else if myAge < yourAge {
    "I am younger than you :)"
} else {
    "We are the same age!"
}

let myMothersAge = myAge + 30
let doubleMyAge = myAge * 2

//MARK: Unary prefix
///works only in 1 value
let foo = !true

//MARK: unary postfix
// !very seldom
let name = Optional("Ethan")
type(of: name)
let unaryPostFix = name!
type(of: unaryPostFix)

//safetly unwrapp this
if let unwrappedName = name {
    let unaryPostFix = unwrappedName
    print(unaryPostFix)
} else {
    print ("name is nil")
}

//MARK: binary infix (infix -> in between)
let result = 1 + 2
let names = "Foo" + " " + "Bar"



let age = 30
//let message: String
//
//if age >= 18 {
//    message = "You are an adult"
//} else {
//    message = "You are not an adult"
//}
//
//message


let message = age >= 18 ? "You are an adult" : "You are not an adult"
