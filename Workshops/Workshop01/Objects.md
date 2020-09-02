# Objects in swift

These tasks will focus on objects in Swift and some examples that show the differences between value and reference types.

# Task 1

Create a *class* called `Duelist` and a *struct* called `Sentinel`. Both should have a variable called rank, which is a *String*, and a constant name, which is also a *String*. In the case of `Duelist`, the rank variable defaults to "Iron", whereas `Sentinel` has no default values. Create an instance of each.

_Note how the struct has an automatically generated constructor, whereas the class requires that you implement an init method of your own._

# Task 2

Create a function `updateRank` that takes a *Duelist* and a *String* as parameters, and sets the *rank* variable of the Duelist to the given String. Now create a similar function that updates the rank of a *Sentinel* instead.

*Tip: Structs are value types, and therefore pass-by-copy by default. You have to specify that you want to pass by reference if you want to modify the original struct instance.*

# Task 3

Come to think of it, rank seems like an excellent place for an enum. Let's implement it! Create an enum called `Rank`. It should have the cases `iron`, `silver`, `gold`, `platinum`, `diamond` and `immortal`. Change the rank variable in your *Sentinel* and *Duelist* definitions from String to Rank.

# Task 4

The function we created in Task 2 seems like something that should be an instance method. Also, it really does not make sense that someone can go from one rank to any other given rank. Ranking up happens in a set order after all, right? Create a method in both *Sentinel* and *Duelist* called `rankUp`. The method should switch on the rank variable and set it one rank higher. If there is not already a rank present, set it to *.iron*. If at max rank, do nothing.

# Task 5

Add a property observer to the rank variable so that whenever it is set, a message is printed stating that rank has changed.

# Task 6

Classes can do something that structs cannot; inherit! Create a new class called `Reyna` that inherits from `Duelist`. The syntax for inheriting is fairly simple, just add a colon and the name of the super class in your sub classes definition like this: `class MySubClass: MySuperClass {}`. Reyna should have a constant Bool called `isBaiting` which is defaulted to true.

# Task 7

Create a variable called reyna that is an instance of the *Reyna* class and call `rankUp()` on it. Print the rank.

_Notice how Reyna has access to the initializer and methods from Duelist? Reyna has inherited them._

# Task 8

Create a variable called duelist that is of type *Duelist*. Assign the duelist variable to the reyna variable you previously created. Call `rankUp()` on duelist, then print the reyna variable's rank.

_Because class objects are reference type we can assign several variables to the same instance. The reyna and duelist variables are effectively identical here._

# Task 9

Even though the two variables are of different types, they both point to the same instance. Knowing that our duelist variable is actually a Reyna, how do we figure out if it *isBaiting*? We can downcast it! In Swift, we cast by using the `as` keyword. Example:
```
let a: MySuperClass = MySubClass()

// Conditional downcast. Nil if unsuccessful.
let b = a as? MySubClass

// Force downcast. Crash if unsuccessful.
let b = a as! MySubClass
```

Use casting to check the `isBaiting` value for the duelist variable. If true, print "Shame 🔔", otherwise print "🎉🎉🎉".
