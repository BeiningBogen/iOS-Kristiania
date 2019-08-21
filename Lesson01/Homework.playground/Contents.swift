import UIKit

/*:

 # Exercises for Lecture #1


 #### Task #1

  Define a constant with "Swift is cool!".
- Try to set the value to something else.
- Why did you get an error message now?
- Change the code so that you can change the value without getting an error message

*/


/*:
## Task #2

Create a constant with an explicit String type and the value "iOS FTW" - Then remove the type. Why is this possible?

*/


/*:
 ## Task #3

 Create a numeric constant and a string constant, then create a constant that contains both.
 Complete this with string interpolation and without.

*/


/*:
 ## Task #4

Create an expression with string interpolation where you calculate the sum of 5 * 120 as part of the interpolation, print it using print()

*/


/*:
 ## Task #5

Compare two strings and print "they are equal", if they are exactly the same, or "they are different" if they are different

*/


/*:
 ## Task #6

Create a tuple with the content (5600, “iOS programming”). Then use print to print “PG5600 - iOS Programming”
 
*/



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

/*:
 ## Task #8

Create a dictionary with 5 key-value pairs, loop over it and print key and value with print

*/



/*:
 ## Task #9

Create a new iOS project in "Single View Application" Xcode.
1. Find the place called when the application starts up
2. Define strict constants for title, message and button.
3. Create a UIAlertView that uses the constants you have defined.
4. Call a method. show on the uialertview instance.
5. Run the simulator and verify that the text string appears.
*/


//:## Task #10

//:You got these two objects with data from an API, unfortunately it has come up with slightly different values in the array,
//:but the index and number of launches are still correct - Falcon 9 has 19 launches, Atlas V has 55, etc.
let rockets : [Any?] = ["Falcon 9", nil, -999, nil, "Atlas V", nil, "Space Shuttle", nil, "My Water bottle-rocket"]
let numberOfLaunches = [19, 55, 135, 1]

//:    Go through the rockets and print the rocket's name and number of launches in the format
//:    Falcon 9 : 19 launches
//:    ...
//:    My water bottle-rocket : 1 launch        // note that that there the missing plural "s" when there is only 1 launch


//:## Task #11

//: complete the following functions to return the expected result

func parseLanguages(languages: String) -> [String] {
    // Write your code here
    return []
}

func sortLanguages(languages: [String]) -> [String] {
    // Write your code here
    return []
}

let languages = "Swift, Java, Objective-C, Python"

let languagesArray = parseLanguages(languages: languages)

let sortedLanguages = sortLanguages(languages: languagesArray)

print(sortedLanguages)

//: expectd result: ["Java", "Objective-C", "Python", "Swift"]
