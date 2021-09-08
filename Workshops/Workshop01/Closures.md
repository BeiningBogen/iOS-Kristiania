# Closures in swift

These tasks will be focused on using closures so that we can familiarize ourselves with the syntax. 
Here's a handy: [cheat sheet](https://fuckingclosuresyntax.com).

## Task 1

Closure syntax looks something like
```
{ (parameterTypes) -> returnType in
    expression
}
```

Declare a closure (as a constant) that takes a number and returns its value multiplied by 2.

## Task 2

If the compiler knows what types to expect in the closure, we can omit them from the closure "signature" like this:

```
{ (names) in
    expression
}
```

In the case of our constant, we can let the compiler know by specifying the types in the constant definition.

```
let closure: (parameterTypes) -> returnType
```

Declare a second closure, but this time with the types in the constant definition, and omitting types from the closure signature.

## Task 3

We can go even further in our strive for compact code by omitting even the names.
```
{
    expression
}
```
In this case, we can refer to our values in the closure with $0, $1, $2 and so on. Try it!

## Task 4

Just like any other constant or variable, a closure can also be optional.
```
let closure: ((parameterTypes) -> returnType)?
```

Declare an optional closure and try calling it.

## Task 5

More commonly we'll see closures as function parameters. Declare a function with three parameters; an Int, a second Int and lastly a closure that takes a Bool and returns nothing. The function should check if the first Int is divisible by the second Int, and call the closure with the result, e.g. true or false.

It should be possible to call your function like this:
```
isDivisible(a: 14, b: 7, closure: { (isDivisible: Bool) -> Void in
    if isDivisible {
        print("They're totally divisible!")
    } else {
        print("Bummer...")
    }
})
```

## Task 6

Just like in Task 2, the compiler should be able to infer the types in our call here. Call your function as in the above example, but omit the types.

## Task 7

Because the closure is the last parameter in our function, we can use something called trailing closure syntax. This lets us write what we would usually write as
```
someFunction(param: 42, closure: { (isAnswer: Bool) -> String in
    // ...stuff
})
```
as this instead:
```
someFunction(param: 42) { (isAnswer: Bool) -> String in
    // ...stuff
}
```
Call your function using a trailing closure. This can of course be combined with implied types like in Task 6 to make it even more compact!

## Task 8

If you're familiar with functional programming, you've probably encountered the `map` function in some form. In Swift, the `map` implementation for arrays has the signature
`func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]`. More simply explained this translates to "return a new array with the given transformation (a closure) applied to each element." An example is probably more helpful...

```
let array = [0, 1, 2]
let mappedArray = array.map { $0 * 3 }
print(mappedArray) // [0, 3, 6]
```

Now, let's put it to the test!

```
struct Person {
    let name: String?
}

let people = [Person(name: "Edd"), Person(name: "Ed"), Person(name: "Eddy"), Person(name: nil)]
```

Use `map` to create a new array with the length of the name of each person in the people array. If the person does not have a name, the length should be 0.

## Task 9

If we wanted to print the name of each person in the array, we could of course use a normal for-loop, but there is also a functional way that, you guessed it, uses a closure! `func forEach(_ body: (Element) throws -> Void) rethrows`. Use this to print the length of the names that you just found.

## Task 10

Printing 0 for nil values isn't exactly right. Maybe we would rather ignore them? For that, there is a variation of map called `compactMap`. It does the same as `map`, but will remove any nil values.

```
let values = ["No", "more", nil]
let values2 = values.compactMap { $0 } // ["No", "more"]
```

Use this to map people to their names while ignoring the ones where names are nil.


## Further reading

There are a ton of really useful functions, like `map` and `compactMap`, that use closures. These functions are not in themselves part of the curriculum, but they're really handy and a good way of getting to know closures. Here are some links to Apple docs for a few of them:

- [map(_:)](https://developer.apple.com/documentation/swift/array/3017522-map) Returns an array containing the results of mapping the given closure over the elements.
- [compactMap(_:)](https://developer.apple.com/documentation/swift/sequence/2950916-compactmap) Returns an array containing the non-nil results of calling the given transformation with each element.
- [forEach(_:)](https://developer.apple.com/documentation/swift/array/1689783-foreach) Calls the given closure on each element in the sequence in the same order as a for-in loop.
- [flatMap(_:)](https://developer.apple.com/documentation/swift/array/3126947-flatmap) Returns an array containing the concatenated results of calling the given transformation with each element.
- [sort(by:)](https://developer.apple.com/documentation/swift/array/2296801-sort) Sorts using the given predicate as the comparison between elements.
- [filter(_:)](https://developer.apple.com/documentation/swift/sequence/3018365-filter) Returns an array containing the elements that satisfy the given predicate.
- [reduce(_:_:)](https://developer.apple.com/documentation/swift/array/2298686-reduce) Returns the result of combining the elements using the given closure.
- [contains(where:)](https://developer.apple.com/documentation/swift/array/2297359-contains) Returns a Bool indicating whether it contains an element that satisfies the given predicate.
- [allSatisfy(_:)](https://developer.apple.com/documentation/swift/array/2994715-allsatisfy) Returns a Bool indicating whether every element satisfies a given predicate.
- [first(where:)](https://developer.apple.com/documentation/swift/array/1848165-first) Returns first element that satisfies the given predicate.
