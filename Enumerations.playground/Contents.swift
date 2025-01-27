import Foundation

enum Animals {
    case cat, dog, rabbit
}

let cat = Animals.cat
cat

//MARK: using if
if cat == Animals.cat {
    "This is a cat"
} else if cat == Animals.dog {
    "This is a dog"
} else {
    "This is something else"
}


//MARK: using switch
//this ensure that all cases as covered. this is pretty safe. Use switch is you are working with an enumeration
func describeAnimal(_ animal: Animals) {
    switch animal {
        case .cat:
        "This is a cat"
        break
        case .dog:
        "This is a dog"
        break
        case .rabbit:
        "This is a rabbit"
    }
}

describeAnimal(Animals.rabbit)


//MARK: Enums with associated values
enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!
)

/// TO CHECK
//1
switch wwwApple {
case .fileOrFolder(let path, let name):
    path
    name
    print("It's a file or folder.")
    break
case .wwwUrl(let path):
    path
    print("It's a URL: \(path)")
    break
case .song(let artist, let songName):
    artist
    songName
    print("It's a song.")
    break
}


//2 BETTER
switch wwwApple {
case let .fileOrFolder(path, name):
    path
    name
    print("It's a file or folder.")
    break
case let .wwwUrl(path):
    path
    print("It's a URL: \(path)")
    break
case let .song(artist, songName):
    artist
    songName
    print("It's a song.")
    break
}

// If we only care if the url is valid url
if case let .wwwUrl(path) = wwwApple {
    path
    print("It's a URL: \(path)")
} else {
    print("It's not a URL.")
}


let withoutYou = Shortcut.song(artist: "Symphony X", songName: "Without You")

if case let .song(_, songName) = withoutYou {
    songName
}


// ----------------------------------------------------
//If the enum have similar matching
//enum Vehicle {
//    case car(manufacturer: String, model: String)
//    case bike(manufacturer: String, yearMade: Int)
//    
//    var manufacturer: String {
//        switch self {
//        case let .car(manufacturer, _),
//            let .bike(manufacturer, _):
//            manufacturer
//        }
//    }
//}
//
//let car = Vehicle.car(manufacturer: "Tesla", model : "X")
//car.manufacturer
//
//
//let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)
//bike.manufacturer


//MUCH FLXIBLE
enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)

    func getValue(for property: String) -> Any? {
        switch self {
        case let .car(manufacturer, model):
            switch property {
            case "manufacturer": return manufacturer
            case "model": return model
            default: return nil
            }
        case let .bike(manufacturer, yearMade):
            switch property {
            case "manufacturer": return manufacturer
            case "yearMade": return yearMade
            default: return nil
            }
        }
    }
}

let car = Vehicle.car(manufacturer: "Tesla", model: "X")
print(car.getValue(for: "manufacturer") as! String) // Output: Tesla
print(car.getValue(for: "model") as! String)     // Output: X

let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)
print(bike.getValue(for: "manufacturer") as! String) // Output: HD
print(bike.getValue(for: "yearMade") as! Int)      // Output: 1987


//-------------------------------------------------------
//:enumeration of raw wvalues
enum FamilyMember: String {
    case father = "Dad",
         mother,
         brother,
         sister
}
FamilyMember.father.rawValue
FamilyMember.mother.rawValue


enum FavoriteEmoji: String, CaseIterable {
    case blush = "😊",
         rocket = "🚀",
         fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.blush.rawValue
FavoriteEmoji(rawValue: "😊")
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "😊") {
    "found the blush emoji"
    blush
} else {
    "Nothing"
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
    "snow exists, really?"
    snow
} else {
    "Snow doesnt exist in our enum"
}


//MARK: Mutating func inside enum
enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong() // mutate
myHeight


// ----------------------------------------
//MARK: RECURSIVE Enum (enumations refer to itself)
indirect enum IntOperation {
    case add(Int, Int)
    case substract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(of operation: IntOperation? = nil) -> Int {
        switch operation ?? self {
        case let .add(int1, int2):
            int1 + int2
        case let .substract(int1, int2):
            int1 - int2
        case let .freeHand(operation):
            calculateResult(of: operation)
            
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2, 3))
freeHand.calculateResult()
