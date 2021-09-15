import UIKit

// MARK: - Functions & Closures

// a function that takes two numbers and returns a number.
// note the external and internal parameter names
func multiply(_ number: Int, by other: Int) -> Int {
    return number * other
}
multiply(1, by: 1)

// verbose closure constant
let isIntDivisableByTwo: (Int) -> Bool = { (number: Int) -> Bool in
    return number % 2 == 0
}

// types omitted for the constant because they are inferred from the closure
let isIntDivisableByTwo2 = { (number: Int) -> Bool in
    return number % 2 == 0
}

// types omitted in the closure because they are inferred from the constant type
let isIntDivisableByTwo3: (Int) -> Bool = { number in
    return number % 2 == 0
}

// names omitted in the closure, using index instead
let isIntDivisableByTwo4: (Int, Int) -> Bool = {
    return ($0 + $1) % 2 == 0
}

// a function with a closure parameter
func myFunc(number: Int, closure: (Bool) -> Void) {
    let predicate = isIntDivisableByTwo(number)
    closure(predicate)
}

myFunc(number: 4, closure: { isDivisable in
        if isDivisable {
            print("Delbar")
        }
})


func f(_ a: Int) -> Bool {
    return true
}

// ...is the same as

let f: (Int) -> Bool = { _ in
    return true
}

f(1)

// MARK: - Enumeration

enum Role {
    case student
    case teacher
}

struct Person {
    let type: Role
    
    func role() {
        switch type {
        case .student:
            print("student")
        case .teacher:
            print("teacher")
        }
    }
}

// MARK: - Classes & Structs

class Klasse {
    var a = 1
}

struct Strukt {
    var a = 1
}

let klasse = Klasse()
let klasse1 = klasse
klasse1.a = 2
print(klasse.a) // 2

var strukt = Strukt()
var strukt2 = strukt
strukt2.a = 2
print(strukt.a) // 1

// MARK: - Computed Properties

var stored = "A string"
var computed: String {
    get {
        return "\(stored), but computed"
    }
    set {
        stored = newValue
    }
}
print(computed)
computed = "A very cool string"
print(computed)

// MARK: - Property observers

var stored2 = "String" {
    didSet {
        print("stored2 endret seg")
    }
}
stored2 = "Another one"

// MARK: - Methods

struct StruktEksempel {
    static func statisk() {
        
    }
    
    func metode() {
        
    }
}
StruktEksempel.statisk()
let instans = StruktEksempel()
instans.metode()

// MARK: - Access control
struct MyStruct {
    private let privat = ""
    public let publisert = ""
    let ikkeDefinert = ""
}
