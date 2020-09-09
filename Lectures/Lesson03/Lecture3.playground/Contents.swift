import UIKit


var stored = "Hello World" {
    willSet {
        print("Will set...")
    }
    didSet {
        print("Did set...")
    }
}
stored = "Bye world..."

var name = "Benji"
var computed: String {
    get {
        return "Hei \(name)"
    }
    set { // optional
        // Her kan vi gjøre noe før vi setter, altså samme som willSet
        name = newValue
        // her kan vi gjøre det samme som en didSet
    }
}

// Stored property som initialiseres med en closure
let label: UILabel = {
    let label = UILabel()
    label.text = "Hello WOrld"
    return label
}()


class TestSubscript {
    let name: String
    let surname: String? = nil
    let array = ["The Answer", "Is", "42"]

    required init(name: String) {
        self.name = name
    }

    convenience init() {
        self.init(name: "Benji")
    }

    subscript(index: Int) -> String {
        get {
            return array[index]
        }
    }

    func getName() -> String {
        return name
    }
}

class Sub: TestSubscript {
    let middleName = "Bulle"

    required init(name: String) {
        super.init(name: name)
    }

    convenience init() {
        self.init(name: "Benji")
    }

    override func getName() -> String {
        return "\(name) \(middleName)"
    }
}

let convenience = TestSubscript()

let a = TestSubscript(name: "Benji") // init blir implisitt kalt
let b = a[2]
print(b)

let c = TestSubscript.init(name: "Benji") // akkurat som som TestSubscript()

class Example {
    let name = "Benji"
}

let example = Example()

let base = TestSubscript()
print(base.getName())

let sub = Sub()
print(sub.getName())


class Student {
    weak var teacher: Teacher? = nil
    deinit {
        print("Student being deinited")
    }
}

//let student2 = Student()
//if student2 is Student { // true
//    print("Student is a student. Surprisingly.")
//}

class Teacher {
    var student: Student? = nil
    deinit {
        print("Teacher being deinited")
    }
}

var student: Student? = Student()
var teacher: Teacher? = Teacher()

student?.teacher = teacher
teacher?.student = student

student = nil
teacher = nil

let teacher2 = student?.teacher // enten teacher eller nil
//let teacher3 = student!.teacher // enten teacher eller crash dersom nil
let teacher4 = (student ?? Student()).teacher // (verdi ?? default verdi dersom verdi er nil)


let sub2: TestSubscript = Sub()

if sub2 is Sub {
    print("Is a sub!")
}

if let sub2AsSub = sub2 as? Sub {
    print("Hello \(sub2AsSub.getName())")
}

let array: [Any?] = ["streng", 42, nil, "a"]
//let array2 = array.compactMap { $0 as? String }
//print(array2)

var stringArray: [String] = []

for element in array {
//    if let element = element as? String {
//        stringArray.append(element)
//    }

    switch element {
    case let element as String where element.count > 2:
        print(element)
    case let element as String:
        print("Short string!")
    default:
        print("Default!")
    }
}
print(stringArray)


func doubleIfExists(tall: Int?) -> Int? {
    guard let tall = tall, tall > 1 else {
        return nil
    }

    return tall * 2
}

class Aclass {
    // masse innmat

//    .
//    .
//    .
//    .
//
//    .
//    .
//    .
//    .

}

//let dictionary: [Aclass: Int] = [:]

protocol Doubleable {
    func double() -> Int
}

extension Doubleable {
    func double() -> Int {
        return 0
    }
}

extension Int: Doubleable {
    func double() -> Int {
        return self * 2
    }

    static var one: Int { 1 }
//    func double() -> Int {
//        return self * 2
//    }
}

let four = 2.double()
let one = Int.one
print(four)

let myStringArray = Array<String>() // struct Array<T> {}


protocol GiffString {
    associatedtype Item
    func giveMeAnItem() -> Item
}

class TestTypeAlias: GiffString {
    typealias Item = String

    func giveMeAnItem() -> Item {
        return "Hello type alias!"
    }
}


class TestOperator {
    static func + (left: TestOperator, right: TestOperator) -> TestOperator {
        return TestOperator()
    }
}

let first = TestOperator()
let second = TestOperator()
let result = first + second

1 + 2

prefix operator -- // --1
infix operator -- // 1 -- 1
postfix operator -- // 1--

extension Int {
    static prefix func -- (value: Int) -> Int {
        return value < 0 ? value : -value
    }

    static func -- (left: Int, right: Int) -> Int {
        return left + (--right)
    }

    static postfix func -- (value: Int) -> Int {
        return value - 1
    }
}

let value1 = -1
let value2 = 1
print("1: \(--value1)")
print("2: \(--value2)")
print("3: \(value2 -- value1)")
print("4: \(value2--)")


let dict = [1: 2, 3: 4, 4: 2]
func swap(_ dict: Dictionary<Int, Int>) -> Dictionary<Int, Int> {
    var result: [Int:Int] = [:]

    for element in dict {
        if let base = result[element.value] {
            result[element.value] = base + element.key
        } else {
            result[element.value] = element.key
        }
    }

    return result
}
let swapped = swap(dict)
print(swapped)

enum Rank: String {
    case iron
    case silver
    case gold
    case platinum
    case diamond
    case immortal
}

class Duelist {
    var rank: Rank {
        didSet {
            print("Rank was set from \(oldValue.rawValue) to \(rank.rawValue)")
        }
    }
    let name: String
    
    init(name: String, rank: Rank = .iron) {
        self.name = name
        self.rank = rank
    }
    
    convenience init(rank: Rank = .iron) {
        self.init(name: "", rank: rank)
    }
    
    func rankUp() {
        switch rank {
        case .iron:
            rank = .silver
        case .silver:
            rank = .gold
        case .gold:
            rank = .platinum
        case .platinum:
            rank = .diamond
        case .diamond:
            rank = .immortal
        case .immortal:
            // no radiant rank :(
            break
        }
    }
}

class Reyna: Duelist {
    let isBaiting = true
}

struct Sentinel {
    var rank: Rank {
        didSet {
            print("Rank was set from \(oldValue.rawValue) to \(rank.rawValue)")
        }
    }
    let name: String
    
    mutating func rankUp() {
        switch rank {
        case .iron:
            rank = .silver
        case .silver:
            rank = .gold
        case .gold:
            rank = .platinum
        case .platinum:
            rank = .diamond
        case .diamond:
            rank = .immortal
        case .immortal:
            // no radiant rank :(
            break
        }
    }
}

//let duelist = Duelist(name: "Reyna")
//var sentinel = Sentinel(rank: .gold, name: "Sage")
//
//func updateRank(duelist: Duelist, rank: Rank) {
//    duelist.rank = rank
//}
//
//func updateRank(sentinel: inout Sentinel, rank: Rank) {
//    sentinel.rank = rank
//}
//
//updateRank(duelist: duelist, rank: .silver)
//updateRank(sentinel: &sentinel, rank: .platinum)

var reyna = Reyna(name: "Reyna")
reyna.rankUp()
print("Reyna's rank: \(reyna.rank.rawValue)")

var duelist: Duelist = reyna
duelist.rankUp()
print("Reyna's rank: \(reyna.rank.rawValue)")

if let duelistAsReyna = duelist as? Reyna {
    if duelistAsReyna.isBaiting {
        print("Shame")
    } else {
        print("Neat!")
    }
}

struct Team {
    let array: [Duelist]
    var diversity: Int {
        var uniqueRanks: [Rank] = []
        for duelist in array {
            if !uniqueRanks.contains(duelist.rank) {
                uniqueRanks.append(duelist.rank)
            }
        }
        return uniqueRanks.count
    }
}

let duelists = [Duelist(rank: .silver),
                Duelist(rank: .silver),
                Duelist(rank: .gold),
                Duelist(rank: .platinum),
                Duelist(rank: .gold)]
let team = Team(array: duelists)
print("Team diversity = \(team.diversity)")


var sentinel1 = Sentinel(rank: .gold, name: "Noe")
var sentinel2 = sentinel1
sentinel2.rankUp()
print("Sentinel 1 rank: \(sentinel1.rank)")
print("Sentinel 2 rank: \(sentinel2.rank)")
