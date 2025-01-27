import Foundation

// closures are special functions inline that can be passed to another function, and can hold function.


//USING FUNCTION
func add(_ lhs: Int, _ rhs: Int) -> Int {
    lhs + rhs
}

//MARK: INLINE CLOSURE
let addClosure: (Int, Int) -> Int = {
    (lhs: Int, rhs: Int) -> Int in //function inline
    lhs + rhs
}
addClosure(10, 20)

//MARK: ASSIGNING A FUNCTION TO A CLOSURE VARIABLE
let newAddClosure: (Int, Int) -> Int = add
let result = newAddClosure(2, 2)


/// IMPORTANT! EXAMPLES
//MARK: Simple Task (Inline Closure)
let numbers = [1, 2, 3, 4]
let doubled = numbers.map { $0 * 2 } //inline closure
print(numbers)
print(doubled)

//MARK: Reusable Logic (Function)
func mutiply(_ lhs: Int, _ rhs: Int) -> Int {
    lhs * rhs
}

let newNumbers = [1, 2, 3, 4]
let newDoubled = newNumbers.map { mutiply($0, 2) }
print("newDoubled is: \(newDoubled)")


//MARK: Higher-order function (Inline closure)
let newerNumbers = [1, 2, 3, 4]
let evenNumber = numbers.filter {$0 % 2 == 0 }
print("even numbers: \(evenNumber)")


//MARK: Complex logic (Function)
func calculateDiscount(price: Double, discountRate: Double) -> Double {
    let discountAmount = price * discountRate
    return price - discountAmount
}

let discountedPrice = calculateDiscount(price: 100, discountRate: 0.2)
print("The discountedPrice is \(discountedPrice)")


// ----------------------------------------------------
//MARK: HIGHER ORDER FUNCTION (a func that takes another func or closure as a parameter
/*
 - Use this when function needs to be dynamic/configurable at runtime
 - Us this to reuse a function for diff operations
 - use when working with higher order functions e.g. map, fulter, reduce where operation is defined by the caller.
 */
func customAdd(_ lhs: Int, _ rhs: Int, using function: (Int, Int) -> Int) -> Int {
    function(lhs, rhs)
}

//MARK:  Trailing closure with explicit types
customAdd(20, 10) { (lhs: Int, rhs: Int) -> Int in //trailing closure
    lhs + rhs
} //This give the compiler more info, BETTER

//MARK: Trailing closure with inferred types
customAdd(20, 10) { (lhs, rhs) in
    lhs + rhs
}

//MARK: Shorthand argument names
customAdd(20, 1) { $0 + $1 }

//MARK: Operator function
customAdd(20, 10, using: +)


// ------------------------------------------------------

let ages = [30, 20, 19, 40]

let descendingAges = ages.sorted { (lhs: Int, rhs: Int) -> Bool in
    lhs > rhs    // if lhs is greater than the rhs then it is descending
}

let ascendingAges = ages.sorted { (lhs: Int, rhs: Int) -> Bool in
    lhs < rhs
    // if rhs is greater than lhs then it is ascending
}

///SIMPLIFIED
let newDescendingAges = ages.sorted { $0 > $1 }
let newAscendingAges = ages.sorted { $0 < $1 }

///MORE SIMPLIFIED
let simplifiedDescendingAges = ages.sorted(by: >)
let simplifiedAscendingAges = ages.sorted(by: <)


//MARK: func where the closure/func is not at as ending parameter of a function. (NON TRAILING)
//This is
func customAdd2( using function: (Int, Int) -> Int, _ lhs: Int, _ rhs: Int) -> Int {
    function(lhs, rhs)
}

customAdd2(using: { $0 + $1 + 10
}, 20, 10)


func addition(_ lhs: Int, _ rhs: Int) -> Int {
    lhs + rhs
}

let resultAddition = customAdd2(using: add, 20, 10)


/**
 - important: As much as possible, use a trailing closure.
 */


// ----------------------------------------------------
//MARK: USIng
func add10To(value: Int) -> Int {
    value + 10
}

func add20To(_ value: Int) -> Int {
    value + 20
}

// Higher-order function to perform addition
func doAddition( on value: Int, using function: (Int) -> Int) -> Int {
    function(value)
}

// Using a closure
doAddition(on: 20) { (value) in
    value + 30
}
doAddition(on: 20) { $0 + 30 } //simplified

// Using named functions
doAddition(on: 20, using: add10To(value:))
doAddition(on: 20, using: add20To(_:))


//-----------------------------------------------------
//MARK: REAL EXAMPLE
func applyDiscount(to price: Double, using discountFunction: (Double) -> Double) -> Double {
    discountFunction(price)
}


//Named discount functions
func tenPercentDiscount(_ price: Double) -> Double {
    price * 0.9
}


//Using the higher order function
let finalPrice1 = applyDiscount(to: 20, using: tenPercentDiscount(_:))

