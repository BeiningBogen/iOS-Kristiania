import UIKit

// ****---- NOTE: These solutions do not follow course progression. ----****

/*:

 # Exercises for Lecture #1


 #### Task #1

  Define a constant with "Swift is cool!".
- Try to set the value to something else.
- Why did you get an error message now?
- Change the code so that you can change the value without getting an error message

*/

// let value = "Swift is cool!"
var value = "Swift is cool!"
value = "We cannot reassign a value defined with let."

/*:
## Task #2

Create a constant with an explicit String type and the value "iOS FTW" - Then remove the type. Why is this possible?

*/

let explicit: String = "iOS FTW"
let implicit = "iOS FTW"

// This is possible because of type inference.
// Swift knows the type of the constant based on the value we assigned to it.


/*:
 ## Task #3

 Create a numeric constant and a string constant, then create a constant that contains both.
 Complete this with string interpolation and without.

*/

let numeric = 42
let string = "The Answer:"
let combined = string + " " + String(numeric)
let interpolated = "\(string) \(numeric)"

/*:
 ## Task #4

Create an expression with string interpolation where you calculate the sum of 5 * 120 as part of the interpolation, print it using print()

*/

let expression = "5 * 120 = \(5 * 120)"
print(expression)


/*:
 ## Task #5

Compare two strings and print "they are equal", if they are exactly the same, or "they are different" if they are different

*/

let a = "String a"
let b = "String b"

print(a == b ? "They are equal" : "They are different")


/*:
 ## Task #6

Create a tuple with the content (5600, “iOS programming”). Then use print to print “PG5600 - iOS Programming”
 
*/

let tuple = (code: 5600, name: "iOS programming")
print(tuple.name)


/*:
 ## Task #7

 Create a loop where you print each word in an array on its own line
 Then create a loop that prints each letter of each word on a new line


Expected result
*/
//:    Falcon 9
//:    Dragon
//:    F
//:    a
//:    l
//:    c
//:    o
//:    n
//:
//:    9
//:    D
//:    r
//:    a
//:    g
//:    o
//:    n

let array = ["Falcon 9", "Dragon"]

for word in array {
    print(word)
}

for word in array {
    for letter in word {
        print(letter)
    }
}

// Bonus functional solution
array.forEach { print($0) }
array.forEach { $0.forEach { print($0) } }

/*:
 ## Task #8

Create a dictionary with 5 key-value pairs, loop over it and print key and value with print

*/

let dictionary = ["Swift" : "Awesome",
                  "Kotlin" : "Also cool",
                  "Java" : "Not so much",
                  "PHP" : "😭",
                  "Hotel" : "Trivago"]

for pair in dictionary {
    print("\(pair.key)? \(pair.value).")
}

// NOTE: Dictionaries are _unordered_, which kind of ruins the meme in this case. 🤷

// Bonus functional solution
dictionary.forEach { print("\($0.key)? \($0.value).") }

/*:
## Task #9

Create a new iOS project in "Single View Application" Xcode.
1. Find the view controller that was created automatically
2. Define strict constants for title, message and button.
3. Create a UIAlertController that uses the constants you have defined.
4. Override `viewDidAppear` and in the function body call the method `present` with the alert controller as an argument
5. Run the simulator and verify that the text string appears.
*/

// See "Task 9" folder.

//:## Task #10

//:You got these two objects with data from an API, unfortunately it has come up with slightly different values in the array,
//:but the index and number of launches are still correct - Falcon 9 has 19 launches, Atlas V has 55, etc.
let rockets : [Any?] = ["Falcon 9", nil, -999, nil, "Atlas V", nil, "Space Shuttle", nil, "My Water bottle-rocket"]
let numberOfLaunches = [19, 55, 135, 1]

//:    Go through the rockets and print the rocket's name and number of launches in the format
//:    Falcon 9 : 19 launches
//:    ...
//:    My water bottle-rocket : 1 launch        // note that that there the missing plural "s" when there is only 1 launch

let rocketsFiltered = rockets.compactMap { $0 as? String }
let rocketLaunches = Dictionary(uniqueKeysWithValues: zip(rocketsFiltered, numberOfLaunches))
rocketLaunches.forEach {
    print("\($0.key): \($0.value) \($0.value > 1 ? "launches" : "launch")")
}

//:## Task #11

//: complete the following functions to return the expected result

func parseLanguages(languages: String) -> [String] {
    return languages.components(separatedBy: ", ")
}

func sortLanguages(languages: [String]) -> [String] {
    return languages.sorted()
}

let languages = "Swift, Java, Objective-C, Python"

let languagesArray = parseLanguages(languages: languages)

let sortedLanguages = sortLanguages(languages: languagesArray)

print(sortedLanguages)

//: expectd result: ["Java", "Objective-C", "Python", "Swift"]
