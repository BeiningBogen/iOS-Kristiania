# Loops & Collections in Swift

Some tasks to familarize you with collection types and loop syntax in Swift.

# Task 1

You might have seen this one before... Write a function that prints the numbers from 0 to 100, but with some exceptions:

1. For every number that is a multiple of 3, print "Tik" instead.
2. For every number that is a multiple of 5, print "Tok" instead.
3. For every number that is a multiple of both 3 and 5, print "TikTok".

# Task 2

Write a function that takes a String as parameter and reverses each word in the String so that an input like `reverse(sentence: "uoY did !ti")` returns `You did it!`.

# Task 3

Write a function that takes a `Set<String>` and removes an element from the set and prints it as long as the set has more than 3 elements left. It should always print at least once, even if the Set that is passed as an argument has less than 3 elements left. You can assume that the set is never empty.

_Note how the printed values come in different orders when you run it again. This is because Set is an unordered collection. Same goes for Dictionary._

# Task 4

Instead of assuming that the set is never empty, we can use something called a *guard statement*. In Swift, the syntax goes like this:
```
guard <condition> else {
    // do something, e.g. print an error message
    return
}

// continue with the program...

```

No more assumptions! Use a guard to make sure the Set in Task 3 is not empty before attempting to loop over it.

_You may note that it is similar to an if-statement, but it has a very nifty feature that if-statements don't. It lets us unwrap conditionals so that we can use them without fear in the rest of our code. Sort of like if let, except the unwrapped value stays unwrapped outside of the guard-scope. Beyond that, using a guard communicates to other coders that the guarded condition being false is an exception to the program flow, whereas using an if communicates "business as usual"._

# Task 5

Write a function that takes an array of tuples `[(String, Int)]` and returns a Dictionary where the first and second value of each tuple represent keys and values respectively.

# Task 6

Write a function that takes a Dictionary `[Int : Int]` and swaps the key and value for each pair. If there are equal values, add their keys together to form the new value. E.g.:

```
let dict = [1: 2, 3: 4, 4: 2]
let swapped = swap(dict)
print(dict) // [2: 5, 4: 3]
```
