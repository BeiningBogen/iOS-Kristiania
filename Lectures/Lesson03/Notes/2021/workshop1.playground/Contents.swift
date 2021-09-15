import UIKit

// Task 1

let closure = { (number: Int) -> Int in
    number * 2
}

// Task 2

let closure2: (Int) -> Int = { number in
    number * 2
}

// Task 3

// Typen her er (Int) -> Int
let closure3: (Int) -> Int = {
    $0 * 2
}

// Task 4

// typealias IntClosure = (Int) -> Int
// let closure5: IntClosure?
// Typen her ((Int) -> Int)?
let closure4: ((Int) -> Int)? = {
    $0 * 2
}

let c3 = closure3(2)
let c41 = closure4!(2) // force unwrap, don't do this. Crashes if nil.
let c42 = closure4?(2) // nil if closure is nil
let c43 = closure4?(2) ?? 0 // 4 om closure ikke er nil, ellers 0

// Task 5

func isDivisible(a: Int, b: Int, closure: (Bool) -> Void) {
    closure(a % b == 0)
}

isDivisible(a: 14, b: 7, closure: { (isDivisible: Bool) -> Void in
    if isDivisible {
        print("They're totally divisible!")
    } else {
        print("Bummer...")
    }
})

// Task 6 & 7

// trailing closure syntax
isDivisible(a: 14, b: 7) {
    if $0 {
        print("They're totally divisible!")
    } else {
        print("Bummer...")
    }
}

// Task 8

let array = [0, 1, 2]
let mappedArray = array.map { $0 * 3 }
print(mappedArray) // [0, 3, 6]

struct Person {
    let name: String?
}

let people = [Person(name: "Edd"),
              Person(name: "Ed"),
              Person(name: "Eddy"),
              Person(name: nil)]

let nameLengths = people.map { person in
    person.name?.count ?? 0
}

// Task 9

for person in people {
    print(person.name ?? "")
}

people.forEach { person in
    print(person.name ?? "")
}

people
    .map { $0.name?.count ?? 0 }
    .forEach { print($0) }

// Task 10

let nameLengthsNoNil = people.compactMap { person in
    person.name?.count
}
