
import Foundation

/*:
 # Exercise #1
 Create an extension on String that allows you to subscript String and get a Character.
 It should fulfill this:

"Hello"[0]      // H
"Hello"[1]      // e
"Hello"[6]      // nil

// Note what happens if you use emojis and subscript them using the same method:

"😸👻🙆🏽"[1]

"LOL😸👻🙆🏽"[5]

*/

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

"Hello"[0]
"Hello"[1]
// "Hello"[6] I think fulfilling this is silly.

/*:

## Exercise #2
Create a class MadScientist subclass of Scientist subclass of Person subclass of LivingBeing
the following attributes must be created:

Madscientist should have madness factor
Scientist should have IQ
Person should have name
livingBeing should have birthDate and birthPlace, these should not be overridden

This should compile:

let madScientist = MadScientist(madnessfactor: 41, IQ: 32, name: "John Doe")

let madScientist2 = MadScientist(IQ: 32)  // HINT: use convenience init and set default values for attributes that are not provided

*/

class LivingBeing {
    let birthDate: String
    let birthPlace: String
    
    init(birthDate: String, birthPlace: String) {
        self.birthDate = birthDate
        self.birthPlace = birthPlace
    }
}

class Person: LivingBeing {
    let name: String
    
    init(birthDate: String, birthPlace: String, name: String) {
        self.name = name
        super.init(birthDate: birthDate, birthPlace: birthPlace)
    }
}

class Scientist: Person {
    let IQ: Int
    
    init(birthDate: String, birthPlace: String, name: String, IQ: Int) {
        self.IQ = IQ
        super.init(birthDate: birthDate, birthPlace: birthPlace, name: name)
    }
}

class MadScientist: Scientist {
    let madnessfactor: Int
    
    init(birthDate: String, birthPlace: String, name: String, IQ: Int, madnessfactor: Int) {
        self.madnessfactor = madnessfactor
        super.init(birthDate: birthDate, birthPlace: birthPlace, name: name, IQ: IQ)
    }
    
    convenience init(madnessfactor: Int, IQ: Int, name: String) {
        self.init(birthDate: "N/A", birthPlace: "N/A", name: name, IQ: IQ, madnessfactor: madnessfactor)
    }
    
    convenience init(IQ: Int) {
        self.init(madnessfactor: -1, IQ: IQ, name: "N/A")
    }
}

let madScientist = MadScientist(madnessfactor: 41, IQ: 32, name: "John Doe")

let madScientist2 = MadScientist(IQ: 32)  // HINT: use convenience init and set default values for attributes that are not provided

/*:
 ## Exercise #3

1. Create a base class Animal, where you will find ways to use final and required as described in the slides
2. Create a method for sleeping, a method for returning the sound the animal makes
3. Then create a subclass, such as Bird, which inherits from the base class Animal
4. Use override to overwrite the base class functionality
5. Create a subclass that inherits the Animal base class
6. Create an array with both subclasses and foreach over them,
7. Identify what type it is and print it using print

*/
class Animal {
    let isReal: Bool
    var isSleeping: Bool = false
    
    required init(isReal: Bool) {
        self.isReal = isReal
    }
    
    func sleep() {
        fatalError("No base implementation")
    }
    
    func sound() -> String {
        fatalError("No base implementation")
    }
    
    final func poke() {
        isSleeping = false
        print(sound())
    }
}

class Dropbear: Animal {
    required init(isReal: Bool) {
        super.init(isReal: isReal)
    }
    
    convenience init() {
        self.init(isReal: true)
    }
    
    override func sleep() {
        print("Drop bear never sleeps.")
    }
    
    override func sound() -> String {
        return "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    }
}

class Axehound: Animal {
    override func sleep() {
        isSleeping = true // zzzz
    }
    
    override func sound() -> String {
        return "RAFO!"
    }
}

let array: [Animal] = [Dropbear(), Axehound(isReal: false)]
array.forEach { print(type(of: $0)) }

/*:
## Exercise #4

1. Create a LivingBeing protocol that has the attributes isAlive, birthDate and deathDate
2. Create a procotol extension that creates the default implementation of isAlive
3. Create a class of Frog following the LivingBeing protocol
4. Implement the class so that this is possible:

var frog = Frog(birthDate: Date())

frog.isAlive     // true

frog.deathDate = Date()

frog.isAlive     // false

*/

protocol LivingBeingProtocol {
    var isAlive: Bool { get }
    var birthDate: Date { get }
    var deathDate: Date? { get set }
}

extension LivingBeingProtocol {
    var isAlive: Bool {
        return false
    }
}

class Frog: LivingBeingProtocol {
    var birthDate: Date
    var deathDate: Date? = nil
    var isAlive: Bool { deathDate == nil }
    
    init(birthDate: Date) {
        self.birthDate = birthDate
    }
}

var frog = Frog(birthDate: Date())

frog.isAlive

frog.deathDate = Date()

frog.isAlive

/*:
## Exercise #5

1. Create what is needed for this if statement to work
2. Make an example of both outcomes of if


if let street = kritiania.students?.first?.address?.street {
    print("The student lives on \(street).")
} else {
    print("Couldn't get the street's name")
}

*/
struct Address {
    let street: String
    let number: String
}

struct Student {
    let address: Address?
}

struct Facility {
    let students: [Student]?
}

let student = Student(address: Address(street: "de_dust", number: "2"))
let kristiania = Facility(students: [student])

if let street = kristiania.students?.first?.address?.street {
    print("The student lives on \(street).")
} else {
    print("Couldn't get the street's name")
}

/*:

## Exercise #6

1. Create extention on String so that the following code will work

```swift
    "AB".length // 2
    "AB".reverse() // Must return BA
    "Abba".contains("AbA") // must return false
    "Abba".contains("Abb") // must return true
```
*/

extension String {
    var length: Int { self.count }
    
    func reverse() -> String {
        return String(self.reversed())
    }
}

"AB".length
"AB".reverse()
"Abba".contains("AbA")
"Abba".contains("Abb")

/*:

## Exercise #7

1. Create an extention on the Array using a method thirdElementInArray

```swift
let anArray = [3,4,24,33]
let anotherArray = ["hello", "world", "!"]
let thirdArray = [23.3]

anArray.thirdElementInArray()    // 24
anotherArray.thirdElementInArray()    // !
thirdArray.thirdElementInArray()    // nil

```
*/

extension Array {
    func thirdElementInArray() -> Element? {
        return self.count > 2 ? self[2] : nil
    }
}

let anArray = [3,4,24,33]
let anotherArray = ["hello", "world", "!"]
let thirdArray = [23.3]

anArray.thirdElementInArray()
anotherArray.thirdElementInArray()
thirdArray.thirdElementInArray()

/*:

# Exercise #8

You have the following state set (you must define the enum yourself):

let isOnline = false
let hasTakenBackup = true
let readyState = .Ready
let name : String? = "User login screen"

func createUser() {

}

8a : Fill in the createUser method with control flow without using guard - check if all bool is true, state is ready, and name has a value

8b : Create a new implementation of the method using as many guard statements as possible
*/

enum ReadyState {
    case ready
}

let isOnline = false
let hasTakenBackup = true
let readyState: ReadyState = .ready
let name : String? = "User login screen"

func createUser() {
    if isOnline && hasTakenBackup && readyState == .ready, let name = name {
        print(name) // create user I guess...
    }
    print("Something went wrong.")
}

func createUserWithGuards() {
    guard isOnline else {
        print("Not online.")
        return
    }
    
    guard hasTakenBackup else {
        print("Missing backup.")
        return
    }
    
    guard readyState == .ready else {
        print("We're not ready.")
        return
    }
    
    guard let name = name else {
        print("Name is nil.")
        return
    }
    
    print(name)
}

/*:

## Exercise #9

Create an array [Any] with 5 different objects, run through the array and use a switch to print the different objects where you print the class name and how many of them you have found so far.

*/

// Value objects, but whatever...
let anyArray: [Any] = [5, "different", "objects", 1.0, true]

for element in anyArray {
    switch element {
    case is String:
        print("It's a String.")
    case is Int:
        print("Oh, an Int!")
    case is Double:
        print("Fancy that, a Double.")
    case is Bool:
        print("By golly, it's true. It really is a Bool.")
    default:
        print("Unknown.")
    }
}

/*:

# Exercise #10

Create a generic method printAllStrings which is generic on CollectionType, which goes through and prints all strings it finds to the console. It should not print objects or types other than strings

let intArray = [ 234, 34 ,33]
let stringArray = [ "hello", "world" ]
let anyObjectArray: [AnyObject] = ["Omg", 234, 342.3]

printAllStrings(intArray)
printAllStrings(stringArray)         // prints: Hello   world
printAllStrings(anyObjectArray)      // prints: Omg
*/

func printAllStrings<T: Collection>(_ collection: T) {
    collection.compactMap { $0 as? String }.forEach { print($0) }
}

let intArray = [ 234, 34 ,33]
let stringArray = [ "hello", "world" ]
let anyObjectArray: [Any] = ["Omg", 234, 342.3]

printAllStrings(intArray)
printAllStrings(stringArray)
printAllStrings(anyObjectArray)

/* --------------- Algorithm excercise --------------- */

/*
 # Background
 
 You and your friends have organised a race. The first to take a picture of every station on the T-bane loop wins!
 The starting point is the university.
 However, you must go by foot!
 Since you're a developer, you think to yourself: I can write an algorithm! That's will win me the race 🎉
 Luckily you have a list of all the stations and their lat/lng.
 
 GO!!
 */

/*
 Let's use a lirbary that will make the claculation a bit simpler.
 
 import CoreLocation
 
 */


/*
 Now, create a struct called Point with 2 stored properties:
 1: location with a type CLLocation
 2: Name which is a String
 
 NB: CLLocation is a class from Apple that deals with geolocations
 You can read about it here: https://developer.apple.com/documentation/corelocation/cllocation
 
 Psssst... CLLocation has a function called distance(from:) 😉
 */

/*
 Your current position is the following:
 
 let currentPosition = Point(location: CLLocation(latitude: 59.9113, longitude: 10.7441), name: "Høyskolen Kristiania")
 */

/*
 Here is a list of all the stations on the T-bane loop
 
var tBane = [
    Point(location: CLLocation(latitude: 59.9127, longitude: 10.7601), name: "Grønland"),
    Point(location: CLLocation(latitude: 59.9493, longitude: 10.7652), name: "Nydalen"),
    Point(location: CLLocation(latitude: 59.9144, longitude: 10.7341), name: "Nationaltheatret"),
    Point(location: CLLocation(latitude: 59.9491, longitude: 10.7344), name: "Ullevål Stadion"),
    Point(location: CLLocation(latitude: 59.9259, longitude: 10.7779), name: "Carl Berners plass"),
    Point(location: CLLocation(latitude: 59.9406, longitude: 10.7231), name: "Blindern"),
    Point(location: CLLocation(latitude: 59.9157, longitude: 10.7756), name: "Tøyen"),
    Point(location: CLLocation(latitude: 59.9458, longitude: 10.7800), name: "Storo"),
    Point(location: CLLocation(latitude: 59.9138, longitude: 10.7419), name: "Stortinget"),
    Point(location: CLLocation(latitude: 59.9268, longitude: 10.7162), name: "Majorstuen"),
    Point(location: CLLocation(latitude: 59.910369, longitude: 10.755436), name: "Jernbanetorget"),
    Point(location: CLLocation(latitude: 59.9339, longitude: 10.7851), name: "Sinsen"),
    Point(location: CLLocation(latitude: 59.9437, longitude: 10.7208), name: "forskningsparken")
]
*/

import CoreLocation
struct Point {
    var location: CLLocation
    var name: String
}

var currentPosition = Point(location: CLLocation(latitude: 59.9113, longitude: 10.7441), name: "Høyskolen Kristiania")

var stations = [
    Point(location: CLLocation(latitude: 59.9127, longitude: 10.7601), name: "Grønland"),
    Point(location: CLLocation(latitude: 59.9493, longitude: 10.7652), name: "Nydalen"),
    Point(location: CLLocation(latitude: 59.9144, longitude: 10.7341), name: "Nationaltheatret"),
    Point(location: CLLocation(latitude: 59.9491, longitude: 10.7344), name: "Ullevål Stadion"),
    Point(location: CLLocation(latitude: 59.9259, longitude: 10.7779), name: "Carl Berners plass"),
    Point(location: CLLocation(latitude: 59.9406, longitude: 10.7231), name: "Blindern"),
    Point(location: CLLocation(latitude: 59.9157, longitude: 10.7756), name: "Tøyen"),
    Point(location: CLLocation(latitude: 59.9458, longitude: 10.7800), name: "Storo"),
    Point(location: CLLocation(latitude: 59.9138, longitude: 10.7419), name: "Stortinget"),
    Point(location: CLLocation(latitude: 59.9268, longitude: 10.7162), name: "Majorstuen"),
    Point(location: CLLocation(latitude: 59.910369, longitude: 10.755436), name: "Jernbanetorget"),
    Point(location: CLLocation(latitude: 59.9339, longitude: 10.7851), name: "Sinsen"),
    Point(location: CLLocation(latitude: 59.9437, longitude: 10.7208), name: "forskningsparken")
]

/*
 Implement this function so that it returns the closest station
 
 remember that you can call distance(from:) on a CLLocation
 Here's the documentation
 
 https://developer.apple.com/documentation/corelocation/cllocation/1423689-distance
 
 */

func closestStation(start: Point, stations: [Point]) -> Point {
    return stations.reduce(stations[0]) {
        let isCloser = start.location.distance(from: $1.location) < start.location.distance(from: $0.location)
        return isCloser ? $1 : $0
    }
}

/*
 While you still have unvisited stations
 Get the closest station to your current position
 Remove it from the list
 Add it to your route
 And don't forget to set currentPosition to your new location 😉
 */

/*
 Print the your route in the following format:
 <order>: <station name>
 
 Output should be:
 
 1: Stortinget
 2: Nationaltheatret
 3: Jernbanetorget
 4: Grønland
 5: Tøyen
 6: Carl Berners plass
 7: Sinsen
 8: Storo
 9: Nydalen
 10: Ullevål Stadion
 11: forskningsparken
 12: Blindern
 13: Majorstuen
 
 */
extension Point: Equatable {
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.name == rhs.name && lhs.location == rhs.location
    }
}

var route: [Point] = []
while stations.count > 0 {
    currentPosition = closestStation(start: currentPosition, stations: stations)
    stations = stations.filter { $0 != currentPosition }
    route.append(currentPosition)
}

route.enumerated().forEach { print("\($0.offset): \($0.element.name)") }
