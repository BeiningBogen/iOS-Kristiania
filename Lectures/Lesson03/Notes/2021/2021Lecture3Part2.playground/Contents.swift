import UIKit

// MARK: - Subscripts

var array = [1, 2, 3]
array[0]

/// Useless wrapper on an array. Just to show subscripts.
struct MyArray {
    private var array = [1, 2, 3]

    subscript(index: Int) -> Int {
        get {
            return array[index]
        }
        set {
            array[index] = newValue
        }
    }

    subscript(string: String) -> Int {
        return 0
    }
}

let instans = MyArray()
let a = instans[0]
//instans[0] = 3
let b = instans["string"]

// MARK: - Inheritance

class Example {
    let property: Int
    let property2: String
    let property3: String = ""
    let property4: String? = nil

    init(property: Int, property2: String) {
        self.property = property
        self.property2 = property2
    }

    convenience init() {
        self.init(property: 2, property2: "3")
    }
}
let example = Example.init() // with convenience init
let example2 = Example.init(property: 1, property2: "") // with the designated init

class Person {
    final var name: String

    required init(name: String) {
        self.name = name
    }

    func about() -> String {
        return name
    }
}

class Student: Person {
    override func about() -> String {
        return "Student: \(name)"
    }
    
    required init(name: String) {
        super.init(name: "q")
    }
}

let benji = Student.init(name: "Benjamin")
let about = benji.about()
let name = benji.name


struct Named {
    let name: String? = nil
    
    func metode() -> String {
        return ""
    }
}

struct NamedWrapper {
    let named: Named? = Named()
}

let wrapper = NamedWrapper()

let test = wrapper.named?.metode()


if let prop = wrapper.named,
   let name = prop.name {
    print(name)
}

if let name = wrapper.named?.name {
    print(name)
}

// MARK: - Type casting

// let isString = "" is Int    // false
// let isString = "" is String // true

let haakon: Person = Student(name: "Haakon")
let haakonStudent = haakon as? Student

let anyArray: [Any] = [1, "", 2.09]
let stringArray = anyArray.compactMap { $0 as? String } // [""]

// MARK: - Guard

func function(number: Int?) -> Bool {
    guard let number = number,
          number >= 0,
          number < 100
    else { return false }
    
    // number is no longer optional
    return number % 3 == 0
}

// MARK: - Extensions

func isDivisibleByTwo(_ number: Int) -> Bool {
    return number % 2 == 0
}

extension Int {
//    func isDivisibleByTwo() -> Bool {
//        return self % 2 == 0
//    }
    /// A bool indicating whether `self` is divisable by two
    var isDivisibleByTwo: Bool {
        return self % 2 == 0
    }
}

4.isDivisibleByTwo

class MyClass {}

extension MyClass {
    var stored: String {
        return ""
    }
}

// MARK: - Protocols

protocol Nameable {
    var name: String { get }
}

extension Nameable {
    var name: String {
        return ""
    }
}

struct Developer: Nameable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Designer: Nameable {
    var name: String = "Kuli"
}

var arrayOfNameables: [Nameable] = [Developer.init(name: "Haakon"),
                                    Designer.init(),
                                    Developer.init(name: "Andreas")]
for nameable in arrayOfNameables {
    print(nameable.name)
}

// We can have variables of a property type just like any other type,
// but the property cannot itself be instantiated, so the value has to an instance of something that implements the property.
let item: String = ""
let item2: Nameable = Developer.init(name: "Benji")

// MARK: - Generics

let array3 = Array<String>()

// Int version...
func isThis(number: Int, biggerThan other: Int) -> Bool {
    return number > other
}

// Generic version... Works on anything comparable, e.g. int, double, string, etc.
func isThis<T: Comparable>(number: T, biggerThan other: T) -> Bool {
    return number > other
}

typealias S = String
let aString: S = "This is just a string."
