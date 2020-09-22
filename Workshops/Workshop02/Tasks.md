## Task 0

Do the exercises for lesson 3 & 4.


## Task 1

Create a funtion that takes as argument String and returns Int?
The strings sent should be converted to Int, but if they can't, it should return nil.

## Task 2

Write a class Vehicle, that has three subclasses Car and Motorbike and airplane.
They should have a computed property numberOfWings, that returns nil if no wings, and 2 for airplanes.


# Task 3

Create a blank app with a UITextField and two buttons.

The textfield should have a placeholder "Enter your text here".
One button, should say "Bold", which should set the textField text to bold when tapped, when tapped again, it should remove bold.
The other button should set the color of the text to a random color.

## Task 4

Extend Task 3 and add a "Submit" button that crashes the app when pressed, if the user has not written any text. If the user has written text, it should show in a popup.


## Task 5

Create an array of Animal objects. Animal should have at least 5 attributes, for example fur color UIColor, wingspan : Int? (nil for non-birds), some attributes should be optional, and some not. When done, print all the attributes to console, use optional chaining where possible.

## Task 6
Create an app with a button, when the user taps it, it should show a popup with information about a random animal in the list. Extend the animal array with a function,   animalArray.randomAnimal() that returns an animal at random index.
The information in the popup should be based on the attributes, and write "Not relevant" if an attribute is nil

## Task 7

Extend the  animal array so that you can use optional chaining to get the animal at a given index. Used to access furcolor:
animals[3]?.furColor   - should write the color of the fourth animal  if less than 4, it should print nil.   

## Task 8

Write a subclass Fish for Animal.Write an initializer that only takes the relevant attributes, and automatically sets the non-relevant to nil, without taking them as arguments. When the user taps the button in Task 6, if its a fish, set the background color in the popup to blue.
Tip: https://stackoverflow.com/questions/37293656/change-uialertcontroller-background-color
