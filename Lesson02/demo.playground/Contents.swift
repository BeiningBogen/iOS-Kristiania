
import Foundation
import UIKit


//# Functions

// Vanlig måte å skrive funksjon uten returverdi
func helloWorld() {
    print ("Hello World!")
}

// Kan også skrives som...
func helloWorld2() -> Void {
    print ("Hello World!")
}

// Eller...
func helloWorld3() -> () {
    print("yo")
}

//# Functions with return values
func helloWorld4() -> String {
    return "Hello World!"
}

//# Functions with optional return values
func helloWorld5() -> String? {
    return nil
}

//# Functions with multiple return values
func tupleFunc() -> (String, Int) {
    return ("Bjarne", 42)
}

print(tupleFunc().0)

// With named variables
func tupleFunc2() -> (name: String, code: Int) {
    return ("Arne", 42)
}

print(tupleFunc2().name)

//# Functions with parameters
func funcWithParams(param: String, int: Int) -> String {
    return "Hei \(param)"
}

funcWithParams(param: "Benji", int: 1)

//# Functions with optional parameters

func funcWithOptionalParams(param: String?) {
    if let actualParam = param {
        print(actualParam)
    }
}

//# Functions with default parameters
func myFunc(name: String, age: Int = 42) {
    
}

myFunc(name: "Benji")
myFunc(name: "Hakon", age: 1337)

//# Functions with renamed parameters
func greetPerson(withName name: String) {
    print("Hei \(name)")
}

greetPerson(withName: "Benjamin")

//# Functions with omitted parameter names

func greet2(_ name: String) {
    
}

greet2("Benji")

// an instance where maybe it would make sense to omit
func showElement(_ show: Bool) {
    // show or not show depending on `show`
}
showElement(true)


//
//# Funksjoner som returnerer/tar imot andre funksjoner
func giveMeFunc() -> (String) -> String { // returner en funksjon som tilsvarer func funcName(_ name: String) -> String {}
    func newFunc(name: String) -> String {
        return "Hi \(name)"
    }
    
    return newFunc(name:)
}

let myFunction = giveMeFunc()
let greeting = myFunction("Dawg")
print(greeting)

// Returning a function that takes no arguments and has no return value
func giveMeFunc2() -> () -> Void {
    func newFunc() {
        print("I deliver you onto the Void.")
    }
    
    return newFunc
}

let myFunction2 = giveMeFunc2()
myFunction2()

//# Closures

//let myClosure = { (variabelNavn: Type) -> ReturType in
// return noe
//}

let myClosure = { (x: String) -> String in
    let a = x
    return "hi \(a)"
}

func withClosure(closure: (String) -> Void) {
    closure("Hi")
}

withClosure(closure: { myString in
    print(myString)
})

// shorthand trailing syntax
withClosure { print($0) }

let a = [42, 1337, 85]

a.sorted(by: { a, b in a >= b })
a.sorted { $0 >= $1 }

//# Enumerations

enum MyEnum {
    case unknown
    case neat
    case something
}

var example = MyEnum.unknown
example = .neat

let example2: MyEnum = .neat

//# Classes and structs
class MyClass {
    var value = 42
}

struct MyStruct {
    var value = 42
}

var classA = MyClass()
var classB = classA
classB.value = 1337
print("\(classA.value) - \(classB.value)") // 1337 - 1337

var structA = MyStruct()
var structB = structA
structB.value = 1337
print("\(structA.value) - \(structB.value)") // 42 - 1337

//# Metoder
class MyOtherClass {
    func myMethod() {
        
    }
}
let myInstance = MyOtherClass()
myInstance.myMethod()

var functionVariable = myInstance.myMethod
functionVariable()

//# Properties
//# Computed properties get set

// normal (stored)
let number = 42
var other = "other"

// computed example

func getFromCache() -> String { return "hi" }
func setCache(value: String) {}

var myComputed: String {
    get {
        print("Getting")
        return getFromCache()
    }
    
    set {
        print("Setting computed")
        setCache(value: newValue)
    }
}

let newThing = myComputed
myComputed = "New value"


//# Property observers (willSet didSet)

var property: String = "Very cool string" {
//    willSet {
//        print("Will change from \(property) to \(newValue)")
//    }
//
//    didSet {
//        print("Did change from \(oldValue) to \(property)")
//    }
    
    willSet(newString) {
        print("Will change from \(property) to \(newString)")
    }
    
    didSet(oldString) {
        print("Did change from \(oldString) to \(property)")
    }
}

property = "Even cooler!"

// Computed property with getter and setter
var computed: String {
    get {
        return "Wassup."
    }
    set {
        print("Nah, can't do that.")
    }
}

computed = "lol"
print(computed)

//# Type properties/type methods - (aka static)

class MyClassAgain {
    class func myStatisMethod() {}
}

MyClassAgain.myStatisMethod()

let instans = MyClassAgain()

struct MyStructAgain {
    static func myStaticMethod() {}
}

MyStructAgain.myStaticMethod()
let instans2 = MyStructAgain()
