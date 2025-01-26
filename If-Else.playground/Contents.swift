import Foundation

let myName = "Ethan"
let myAge = 24
let yourName = "Foo"
let yourAge = 19

if myName == "ethan" {
    "Your name is \(myName)"
} else {
    "Oops, I guess it wrong"
}


if myName == "Ethan" {
    "Now i guessed it correctly"
} else if myName == "ethan" {
    "Aw i guessed it incorrectly"
} else {
    "I dont know either"
}


if myName == "Ethan"  && myAge == 30{
    "Name is Ethan and age is 30"
} else if myAge == 24 {
    "I only guessed the age right"
} else {
    "I dont know"
}


if myAge == 24 || myName == "Fooooo" {
    "Either age is 24, name is Foo or both" //this will execute first
} else if myName == "Ethan" || myAge == 20 {
    "It's too  late to get into this clause"
}

if myName == "Ethan"
    && myAge == 22
    && yourName == "Foo"
    || yourAge == 19 {
    "My name is Ethan and I am 22 years old while your name is Foo... OR... you are 19"
}


if (myName == "Ethan"
    && myAge == 24)
    &&
    (yourName == "Foo"
    || yourAge == 19) {
    "My name is Ethan and I am 24 years old while your name is Foo... OR... you are 19"
} else {
    "Hmm, that didn't work so well"
}
