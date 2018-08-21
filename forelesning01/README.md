
# _PG5600_ iOS-programmering
## Forelesning 1


---

## Håkon Bogen

### Beining & Bogen ###
##### beiningbogen.no

---
#Github-repo

```


https://github.com/BeiningBogen/iOS-Westerdals


```

---
# Agenda

* Praktisk informasjon
* iOS økosystem
* XCode
* Swift

---

# Praktisk informasjon

* The Swift Programming Language
* https://swift.org/
* iOS-programming with Swift - O'Reilly
* En hovedeksamen som teller 100%


---

# iOS økosystem

* Portal: _developer.apple.com_
* Enheter: _iPhone, iPad, Apple Watch, Apple TV_
* Plattform: _iOS / Cocoa Touch / Objective-C/Swift_
* Utviklingsverktøy: _XCode, Instruments, Bots_
* Distribusjon: _App Store, iTunes Connect_

---

# Xcode 8

* Xcode 9 : https://developer.apple.com/support/xcode/
* Xcode 10/Swift 4.2 : slippes iløpet av september

## DEMO

---

# Swift

---

# Hva er Swift?
* _Et programmeringsspråk for iOS og OSX laget av Apple_
* _Open source, brukes mer og mer på servere og andre plattformer_
* _De har fjernet C avhengigheten og Swift tar over for Objective-C_
* _Moderne og kraftig - inspirert at andre moderne språk - Python, Ruby, C#_
* _Fungerer side-om-side med C og Objetive-C_
* _Objektorientert, Imperativt, Funksjonelt_

^ Swift er laget av Apple og tar i bruk mange kjente paradigmer og  som vi kjenner fra andre språk.
De sier at språket har fokus på sikkerhet og det merkes ved at kompileren er
flink til å finne utvikler feil og at de tvinger utviklere til å bruke visse patterns når de utvikler.
Enkelheten kommer frem i den lette syntaxen, de har for eksempel fjernet semi-kolon.
Mye inspirasjon kan man si at har blitt hentet fra språk som .NET familien, spesielt
F#, Java, Lisp, JavaScript, Diverse funksjonelle språk.

---

# Hvordan ser det ut?

---

# Skrive til console

<br>

```swift
			   print("Hello world")

```

---

# Konstanter og Variabler

```swift
let schoolName: String = "Westerdals ACT"

var numberOfemployees: Int = 320
numberOfemployees = 500

```

^ Konstanter deklareres med LET og variabler med VAR
En konstant kan bare bli satt en gang, men det må ikke skje ved kompilering.
I Swift er det foretrukket å bruke konstanter og imutable verdier, med mindre noe skal endre seg
Dette vil blant annet gjøre det enklere i multi-trading og enklere for kompileren.

---

# Type inference
```swift
var numberOfemployees = 350
numberOfemployees = 500


let schoolName = "Westerdals ACT"
```

^Type interence er et stort fokus punkt i Swift.
Det betyr med andre ord at du skjelden trenger å spesifisere typen. Men typen vil fortsatt vœre der.

^De analyserer både oppover og nedover i type-treet.
Det vil si at om du ikke spesifiserer typen, så vil det analysere output av det du setter variabelen din til for å finne typen.

^Men om du setter typen, så vi den typen overskrive den faktiske typen.
For eksempel hvis du setter en Double til å vœre Float.

^Verdier vil aldri automatisk skifte type, så om du skal legge sammen er string og int, så må du eksplisitt konvertere en av dem.

---

# Strenger

```swift
let subject = "iOS programmering"

if(subject == "iOS programmering") {
    print("😘 " + subject)
}
```
Og ja, du kan bruke emojis 😛

```swift

let 🚀 = "falcon 9 rocket"

```

---

# String interpolation

```swift

let n1 = 10, n2 = 8
let mathString = "\(n1) ganger \(n2) er \(n1 * n2)"
//10 ganger 8 er 80

let rocket = "Falcon 9"
print("Det ble skutt opp en \(rocket)")
print("\(rocket.characters.length)")   //  8

```

^Strenger kan kombineres ved hjelp av streng interpolation. Der man også kan skrive matematiske utrykk.
^Det er også laget broer mellom Objective-C sine NSString klasse og Swift String, noe som gjør at man kan benytte disse om hverandre.

---

# Numbers

```swift
let heltall = 30 // Int
let heltall2 : Int = 25
let desimaltall = 30.45
let desimaltall2 : Float = 30.456 // 32 bit presisjon
let desimaltall3 : Double = 30.456 // 64 bit presisjon // Double er default type inferred
```

---

# Tuples

Grupperer flere verdier inn i en verdi. Godt egnet i funksjoner som skal returnere flere verdier - ikke så godt for komplekse datastrukturer.

```swift
let (x, y) = (50, 300)

let error = (455, "Login unavailable")
print(error.1) // Login unavailable

let (statusCode, message) = error
print(statusCode) // 455
```

---

```swift

// Navngitte felter i tupler
let error = (code: 455, message: "Login unavailable")
print(error.message) // Login unavailable
// Nesten som en klasse!

```

---

# Optionals

---

```swift

var userInput: String? = "Halloo"

if userInput == nil {
    print("Du må skrive navnet ditt 😡😡")
} else {
    // unwrapping med !
    let name = userInput!
    print(name)
}
```

^Greit å vite at typer som ikke er optional ikke kan vœre nil.
Da får man kompile error

---
### Optionals?



- http://www.aidanf.net/learn-swift/optionals
- https://learnswiftwithbob.com/course/swift-fundamentals/optionals.html
- http://swift.ayaka.me/posts/2015/10/5/optional
- https://www.youtube.com/watch?v=uT2IHQpE3ms

---

```swift


if let userInput = possibleUserInput {
        print(userInput)		
} else {
   // Håndter at verdien var nil
}
```

^Automatisk unwrapping og sette verdien i en if

---

# Ranges

```swift

for nr in 1...10 { // 1 t.o.m. 10
    print("\(nr) ganger 2 er \(nr*2)")
}

for nr in 1..<10 { // 1 t.o.m. 9
    print("\(nr) ganger 2 er \(nr*2)")
}

```

^_1…10 – Går fra 1 til 10. Og er kjent som en closed range._
 _1..<10 – Går fra 1 til 9. Og er kjent som en half-closed range_


---

# Collection types

_Det finnes tre typer primære collections i Swift_

<br />

* _Arrays_
* _Dictionaries_
* _Set_


^ De vanlige typene finnes også i Swift

---

# Array

```swift
// Deklaring
let jobs = [String]()

let jobs = Array<String>()

// merk ingen spesifisering av type
var jobs = ["Systemutvikler", "Prosjektleder", "Frontend-Utvikler"]

// Uthenting
jobs[0]

// Iterering
for job in jobs {
    print(job)
}
```

^ Et array deklareres på veldig standard måte, med to klammer. Uthenting er som vanlig.
Forskjellig fra objective-c er at type inference gjør at disse er typed arrays

---

```swift
// Modifisering

jobs.append("Rådgiver")
jobs += ["Rådgiver", "Backend-Utvikler"]
jobs[0] = "Backend-Utvikler"
jobs[2..<5] = ["Rådgiver", "Backend-Utvikler", "Prosjektleder"]
```

---

# Dictionary

```swift
// Deklaring
let emptyDictionary = [String: Float]()
var jobs = ["Rådgiver" : 35, "Systemutvikler" : 21, "Prosjektleder" : 32]

// Uthenting
jobs["Systemutvikler"]  // = 35

for (key, value) in jobs {
    println("\(key): \(value)")
}

// Modifisering
people["Rådgiver"] = 45
people["Prosjektleder"] = 81
```

^ I dicionary så holdes ting på normalt nivå og mange av dere kjenner nok igjen dette fra andre språk.

---

# Set

##### Kun for usorterte unike instanser

```swift

var people = Set(["Elon Musk", "Neil DeGrasse Tyson", "Bill Nye"])

people.remove("Elon Musk")   // returnerer nil hvis den ikke finnes

people.insert("Carl Sagan")  


```


---

# Løkker

_Det finnes tre typer løkker_

* _while_
* _do-while_
* _for-in_

^ Ikke noe nytt her altså, og de gjøres på vanlig måte

---

# Control flow
<br />

* _if_
* _switch_
* _guard_

---

# if

* _Ikke noe nytt, parenteser er valgfritt_

```swift
if age <= 10 {
    print("Barn")
} else if age >= 80 {
    print("Gammel")
} else {
    print("I mellom en plass?;)")
}
```

---

# switch

_Her har de gått banans_ ;-)

* _Du trenger ikke bruke break etter hver case_
* _Bruk hvilke som helst object i en switch_
* _Hvis du utelater default case må switch'ene matche alle case, hvis ikke blir det_ compile error

---

```swift
switch age {
case 1,2,3,4,5,6,7,8,9,10:
    println("Du er et barn!")
case 80...100:
    println("Du er gammal!")
default:
    println("I mellom en plass?;)")
}
```

---

# Du kan switche på instanser

``` swift
let childButton = UIButton()
let oldisButton = UIButton()

switch sender {
  case childButton:
    println("Du er et barn!")
  case oldisButton:
    println("Du er gammal!")
  default:
    println("I mellom en plass?;)")
}
```

^ Man kan også switche på instanser av forskjellige typer.

---

# Playground

* _Kjører kode forløpende_
* _Test ut nye algoritme, tester, utforsk apier, rett en bestemt bug_

---

# Playground Demo

---

# REPL

###### _read–eval–print loop støtte_
###### _Startes med ```xcrun swift```_


---

# Swift online editor

https://swiftlang.ng.bluemix.net/#/repl

---

# For å kjøre Swift i terminalen
## må man sette riktig xcode-versjon med
## _`xcode-select`_

_xcode-select -s /Applications/Xcode.app/Contents/Developer_


---

## Videre lesning
* 3-11 i TSPL

---

# Oppgaver

##       https://github.com/BeiningBogen/iOS-Westerdals
