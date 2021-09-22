import UIKit

// MARK: - Subscripts

struct UselessArrayWrapper {
    var wrapped = [1, 2, 3]
    
    subscript(index: Int) -> Int {
        wrapped[index]
    }
    
    subscript(bool: Bool) -> [Int] {
        bool ? wrapped : []
    }
}

let wrapper = UselessArrayWrapper()
wrapper[1]
wrapper[true]

// MARK: - Inheritance

class SuperKlasse {
    var variabel = 1
    
    func metode() -> String {
        return "Super"
    }
}

class SubKlasse: SuperKlasse {
    override func metode() -> String {
        return "Sub"
    }
}

let instans = SubKlasse()
instans.variabel
instans.metode()

// MARK: - Optionals & Optional chaining

struct Wrapper {
    let string: String? = nil
}

let instans2: Wrapper? = Wrapper()

if let instans = instans2, let string = instans.string {
    print(string)
}

if let string = instans2?.string {
    print(string)
}

// MARK: - Guard

func randomFunc() {
    guard let guardedString = instans2?.string
    else { return }
    
    print(guardedString)
}

// MARK: - Type casting

let anyArray: [Any] = [1, "string", true]
let alwaysTrue = anyArray[2] is Bool
let position = anyArray[2] as? Bool

// MARK: - Protocols

protocol SomeProtocol {
    func randomMetode()
}

struct MyStruct: SomeProtocol {
    func randomMetode() {
        return
    }
}

var array2: [SomeProtocol] = []
for element in array2 {
    element.randomMetode()
}

// MARK: - Extensions

extension String {
    var uppercase: String {
        return self.uppercased()
    }
}

let someString = "aBcDeF"
let someStringUppercased = someString.uppercase

// MARK: - Generics

func someMethod<T: SomeProtocol>(a: T) {
    a.randomMetode()
}

//class SomeGenericClass<T> {
//    var wrappedValue: T
//}

var emptyArray = Array<Int>()

// MARK: - ARC

// Automatic reference counting

class Example {
    var name: String
    var wrappedValue: AnyObject? = nil
    weak var weaklyWrappedValue: AnyObject? = nil
    
    init(name: String = "") {
        self.name = name
    }
    
    deinit {
        print("Object named \"\(name)\" is being deinitialized.")
    }
}

var a: Example? = Example(name: "Example") // 1 strong reference to the object
a = nil // 0 strong references, object deinited

var b: Example? = Example(name: "First") // 1 strong reference to object named "First"
var c: Example? = Example(name: "Second") // 1 strong reference to object named "Second"
b?.wrappedValue = c // 2 strong references to object named "Second"
c?.wrappedValue = b // 2 strong references to object named "First"
b = nil // 1 strong reference to object named "First"
c = nil // 1 strong reference to object named "Second"

// We no longer have a variable referencing either object, yet they remain in memory because both have a strong reference to each other. We have created a strong reference cycle, and it is causing a memory leak.


// To fix this, we can use the `weak` keyword.
// This keyword means that the variable does not keep a strong reference.
// If the object it is pointing to is deinitialized, the variable will be nil.
var b2: Example? = Example(name: "First") // 1 strong reference to object named "First"
var c2: Example? = Example(name: "Second") // 1 strong reference to object named "Second"
b2?.weaklyWrappedValue = c // 1 strong reference to object named "Second"
c2?.weaklyWrappedValue = b // 1 strong reference to object named "First"
b2 = nil // 0 strong references to object named "First"
c2 = nil // 0 strong references to object named "Second"
