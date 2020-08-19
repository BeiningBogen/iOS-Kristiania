# Running Swift in the terminal

For these tasks we will be running our programs in the terminal. Make sure Swift is available by running `swift --version`. This _should_ work automatically from Mojave and onwards. If it does not, you can [see here for instructions on installing Swift.](https://swift.org/getting-started/#installing-swift)

## Task 1

Create a new file called `Welcome.swift` and write a print statement with some text in it. In the terminal, move to the directory you saved your file and write `swift Welcome.swift` to run it. Your text should be printed to the terminal. Neat, huh?

_P.S.: If we write `swift` without specifying a file, we open a REPL. This can be useful for quickly testing one-liners. One can input `:quit` to quit the REPL._

## Task 2

The function `readLine()` reads input from the terminal and returns an optional string. Create a new file called `Sup.swift`. Ask the user what their name is, then accept their input. If the input is valid, greet the user!
```
$ Give me your name:
$ Input: He-Man
$ Sup, He-Man!

$ Give me your name:
$ Input:
$ That's not a name though...
```

_Tip: We can print without a newline by specifying the terminator: `print("Input: ", terminator: "")`_

## Task 3

We can compile one or several Swift files into a program with `swiftc`. Now you might be asking yourself: If there are several files, where does the program start? The answer is `main.swift`. Any Swift program starts with this file.

Modify your code from Task 2 to be inside a public function called `greet()`. Now create a file called `main.swift` and call `greet()` in this file. Then compile these two files together by writing `swiftc main.swift Sup.swift -o greetings`. This should create a new executable file called `greetings`. Execute it with `./greetings`.

_As we'll see later in the course, we don't need to worry about `main.swift` when working with iOS as the framework takes care of it for us._

## Task 4

Create a program that manages a list of users and user roles. A user should have a name and a role. A role should have a privilege level which dictates who and what they are allowed to moderate. The program should first ask the user for their username. Once a valid username is given, print a menu in the terminal that gives the user options for moderating the list. Because this is a really shoddy program with garbage level security, it trusts that the user is truthful when it asks them who they are. :-)

Example run:
```
$ ./UserModeration
--- User Moderator 9000 ---
> Who are you?

Input: zonic

> Hello, zonic! :-)

-- Options --
1 - List users
2 - Add user
3 - Edit user
4 - Add user role
5 - Edit user role
Q - Quit

Input: 1

dev1ce
dupreeh
Magisk
Bubzkji
zonic
Xyp9x
gla1ve

-- Options --
1 - List users
2 - Add user
3 - Edit user
4 - Add user role
5 - Edit user role
Q - Quit

Input: 2

> Let's add a user! What's their name?

Input: es3tag

> Cool. And what is their role?

Input: Star

> Neato. They're added.

-- Options --
1 - List users
2 - Add user
3 - Edit user
4 - Add user role
5 - Edit user role
Q - Quit

Input: Q

So long and thanks for all the skins!
```

The point of this task is for you to get a little creative while creating a program with a control flow and (hopefully) several files. It is purposefully not very well defined, so take liberties! If you want to be real fancy you can look up how to store the user info in a file to persist between runs. You could even implement basic password security by storing passwords in a file and require login as opposed to just trusting that the user gives the right username.
