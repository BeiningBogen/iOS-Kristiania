import UIKit



/*:
# Øvingsoppgaver forelesning 2


## Oppgave 1a:
Lag en funksjon, minimum, som tar to verdier, og returnerer den minste

minimum(a: 54, b: 392)   // 54
 

## Oppgave 1b: Lag samme type funksjon for maximum

maximum(a:54, b: 392)    // 392
*/

func minimum<T: Comparable>(a: T, b: T) -> T {
    return a > b ? b : a
}

func maximum<T: Comparable>(a: T, b: T) -> T {
    return a > b ? a : b
}

minimum(a: 54, b: 392)
maximum(a: 54, b: 392)

/*:
## Oppgave 2:
Lag en funksjon, sumOfAllValues, som summerer all verdiene i et array

sumOfAllValues(inArray: [34,10,10,10,100]) //  164

*/

func sumOfAllValues<T: Numeric>(inArray array: [T]) -> T {
    return array.reduce(0, +)
}

sumOfAllValues(inArray: [34,10,10,10,100])

/*:
## Oppgave 3a:
Lag en funksjon, numbersBiggerThan, som tar inn et tall, og et array og returnerer alle verdiene i arrayet som var større enn tallet som ble gitt

numbersBiggerThan(54, [34,39,100,493,1,5])    // [ 100, 493 ]

## Oppgave 3b: Utvid funksjonen til å returnere nil hvis ingen verdier var større enn tallet du ga

numbersBiggerThan(999, [34,39,100,493,1,5])    // nil ,   MERK: nil er ikke det samme som et tomt array

*/

func numbersBiggerThan<T: Comparable>(_ number: T, _ array: [T]) -> [T] {
    return array.filter { $0 > number }
}

numbersBiggerThan(54, [34,39,100,493,1,5])

func numbersBiggerThanOrNil<T: Comparable>(_ number: T, _ array: [T]) -> [T]? {
    let numbers = array.filter { $0 > number }
    return numbers.isEmpty ? nil : numbers
}

numbersBiggerThanOrNil(999, [34,39,100,493,1,5])

/*:
## Oppgave 4a:
Lag denne funksjonen. Output skal være "WWWWW"

repeatCharacter(Character("W"), 5)

*/

func repeatCharacter(_ character: Character, _ count: Int) -> String {
    return String(repeating: character, count: count)
}

repeatCharacter(Character("W"), 5)

/*:
## Oppgave 4b
Utvid funksjonen til å støtte default parametere. Dvs. at når times ikke oppgis, så skal den som standard settes til 1. Output her blir altså "W"

repeatCharacter(Character("W"))
*/

func repeatCharacterWithDefault(_ character: Character, _ count: Int = 1) -> String {
    return String(repeating: character, count: count)
}

repeatCharacterWithDefault(Character("W"))

/*:

## Oppgave 5a :

Lag en funksjon og en enum gjør at du kan definere denne metoden :

setCase(text: "Interstellar", case: .uppercase) // INTERSTELLAR
setCase(text: "Interstellar", case: .lowercase) // interstellar
*/
enum TextCase {
    case uppercase
    case lowercase
}

func setCase(text: String, case textCase: TextCase) -> String {
    switch textCase {
    case .uppercase:
        return text.uppercased()
    case .lowercase:
        return text.lowercased()
    }
}

setCase(text: "Interstellar", case: .uppercase)
setCase(text: "Interstellar", case: .lowercase)

/*:
## Opppgave 5b
utvid funksjonen til å akseptere nil som case argument, hvor den da velger uppercase

setCase(text: "Interstellar", case: nil) // INTERSTELLAR

*/

func setCase(text: String, case textCase: TextCase?) -> String {
    switch textCase {
    case .uppercase:
        return text.uppercased()
    case .lowercase:
        return text.lowercased()
    default:
        return text.uppercased()
    }
}

setCase(text: "Interstellar", case: nil)

/*:
## Oppgave 5c
utvid funksjonen til å ha default nil som case arugment, slik at man kan, men ikke trenger å gi case

setCase(text: "Interstellar") // INTERSTELLAR
*/

func setCaseWithDefault(text: String, case textCase: TextCase? = nil) -> String {
    switch textCase {
    case .uppercase:
        return text.uppercased()
    case .lowercase:
        return text.lowercased()
    default:
        return text.uppercased()
    }
}

setCaseWithDefault(text: "Interstellar")

/*:
## Oppgave 5d
utvid funksjonen til å kunne ta nil som text argument også, men da retunerer nil

setCase(text: nil) // nil

*/

func setCaseOrNil(text: String?, case textCase: TextCase? = nil) -> String? {
    switch textCase {
    case .uppercase:
        return text?.uppercased()
    case .lowercase:
        return text?.lowercased()
    default:
        return text?.uppercased()
    }
}

setCaseOrNil(text: nil)

/*:
## Oppgave 6a
Lag en funksjon som kan ta inn et variabelt antall parametere, og sum regner ut produktet av disse:

calculate(2, 5, 5) // --> 50
calculate(10, 10) // --> 100
*/

func calculate<T: Numeric>(_ values: T...) -> T {
    return values.reduce(1, *)
}

calculate(2, 5, 5)
calculate(10, 10)


/*:
## Oppgave 6b
Utvid funksjonen slik at den støtter utregning av både produkt og sum (med enum som første parameter):

calculate(.Product, 2, 5, 5) // -> 50
calculate(.Product, 10, 10) // -> 100
calculate(.Sum, 2, 5, 5) // -> 12
calculate(.Sum, 10, 10) // -> 20
*/

enum CalculationType {
    case product
    case sum
}

func calculate<T: Numeric>(_ type: CalculationType, _ values: T...) -> T {
    switch type {
    case .product:
        return values.reduce(1, *)
    case .sum:
        return values.reduce(0, +)
    }
}

calculate(.product, 2, 5, 5)
calculate(.product, 10, 10)
calculate(.sum, 2, 5, 5)
calculate(.sum, 10, 10)


/*:
## Oppgave 6c
Endre funksjonen slik at den returnerer flere verdier, og alltid regner ut både produkt og sum:

let result = calculate(2, 5, 5)
print("Produkt: \(result.product), Sum: \(result.sum)")
*/

func calculateBoth<T: Numeric>(_ values: T...) -> (product: T, sum: T) {
    return (product: values.reduce(1, *),
            sum: values.reduce(0, +))
}

let result = calculateBoth(2, 5, 5)
print("Produkt: \(result.product), Sum: \(result.sum)")

/*:
## Oppgave 7
Lag en funksjon getCalculator, som tar imot en operator. Dersom operatoren er gyldig (er + eller *) skal riktig regnefunksjon returneres, som igjen kan kalles for å utføre selve regneoperasjonen. Hvis operatoren ikke er støttet (altså ikke er + eller *) skal nil returneres.

// Skal kunne regne ut produkt ved å bytte ut + med *:
if let calcFn = getCalculator("+") {
print(calcFn([3, 6, 9]))
}
*/

func getCalculator(_ oper: String) -> (([Int]) -> Int)? {
    guard oper == "+" || oper == "*" else { return nil }

    return oper == "+"
        ? { values in values.reduce(0, +) }
        : { values in values.reduce(1, *) }
}

if let calcFn = getCalculator("+") {
    print(calcFn([3, 6, 9]))
}


// Bonus: We can actually pass an operator as an argument.
func getCalculator(_ oper: @escaping ((Int, Int) -> Int)) -> ([Int]) -> Int {
    return { values in
        values.suffix(from: 1).reduce(values[0], oper)
    }
}

let calcAdd = getCalculator(+)
print(calcAdd([3, 6, 9]))
let caldMult = getCalculator(*)
print(caldMult([3, 6, 9]))
let calcMinus = getCalculator(-)
print(calcMinus([3, 6, 9]))
let calcDivide = getCalculator(/)
print(calcDivide([56154, 42]))

//print(calcAdd([])) // woops

/*:
# Oppgave 8
Lag en request-metode som tar inn en string som første
parameter, og en closure som 2. parameter:

request("http://www.vg.no", { beskrivelse in
if beskrivelse {
print(beskrivelse)
} else {
print("Fant ikke noen beskrivelse")
}
})

Når URLen er `http://www.vg.no` som i eksemplet, skal
beskrivelsen være "Verdens gang". Dersom URLen er `http://www.aftenposten.no` skal beskrivelsen være "Aftenposten". I andre tilfeller er beskrivelsen `nil` og `Fant ikke noen beskrivelse` skal skrives ut
*/

func request(_ site: String, _ closure: (String?) -> Void) {
    if site.starts(with: "http://www.vg.no") {
        closure("Verdens gang")
    } else if site.starts(with: "http://www.aftenposten.no") {
        closure("Aftenposten")
    } else {
        closure(nil)
    }
}

request("http://www.vg.no") { beskrivelse in
    if let beskrivelse = beskrivelse {
        print(beskrivelse)
    } else {
        print("Fant ikke noen beskrivelse")
    }
}

/*:

# Oppgave 9 a.

Lag en metode som tar string som 1. parameter, success-closure som 2. parameter, og error-closure som 3.parameter. Response skal være av typen [NSObject : AnyObject], og error skal være av typen NSError

startRequesting(url:"http://http.cat", success: { (response) in
     print(response)
}, failure: { (error) in
     print(error)
}

*/

func startRequesting(url: String,
                     success: ([NSObject : AnyObject]) -> Void,
                     failure: (NSError) -> Void) {
}

startRequesting(url: "http://http.cat", success: { response in
     print(response)
}, failure: { (error) in
     print(error)
})


/*:
# Oppgave 9 b.

Gjør om metoden til å kunne kalles med optional failure closure som er default nil.

startRequesting(url:"http://http.cat", success: { (response) in
     print(response)
}
*/

func startRequesting(url: String,
                     success: ([NSObject : AnyObject]) -> Void,
                     failure: ((NSError) -> Void)? = nil) {
    
}

startRequesting(url:"http://http.cat", success: { response in
     print(response)
})

/*:
# Oppgave 9 c.

Legg til en enum som sier hva slags HTTP-verb som skal brukes
enumen skal ha GET, POST, PUT og DELETE

startRequesting(url:"http://http.cat", method: httpMethod.GET, success: { (response) in
     print(response)
}
*/

enum RequestMethod {
    case GET
    case POST
    case PUT
    case DELETE
}

func startRequesting(url: String,
                     method: RequestMethod,
                     success: ([NSObject : AnyObject]) -> Void,
                     failure: ((NSError) -> Void)? = nil) {
}

startRequesting(url:"http://http.cat", method: .GET, success: { response in
     print(response)
})

/*:
# Oppgave 10:

Fullfør dette programmet:

// 1. Lag en struct `Coordinate` som inneholder lat/long her

/* 2. Lag en klasse `GeoCache` som har properties for:
- Coordinate
- name
- hint
- log (en array med strenger)

Lag en `signLog` metode som legger igjen en beskjed i cacheloggen
*/

let cache = /* instansier og populer GeoCache, eks:
lat: 59.91126
long: 10.76046
name: Westerdals
hint: Rom 81
*/

cache.signLog("Someone was here...")
cache.signLog("I was here!")
println(cache.description)

Slik at det ender med å skrive ut:

Westerdals
59.0 42.0
Hint: Rom 81

Logg:
Someone was here...
I was here!
*/

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

class GeoCache {
    let coordinate: Coordinate
    let name: String
    let hint: String
    var log: [String] = []
    
    var description: String {
        return "\(name)\n\(coordinate.latitude) \(coordinate.longitude)\nHint: \(hint)\n\nLog:\n\(log.joined(separator: "\n"))"
    }
    
    init(coordinate: Coordinate, name: String, hint: String) {
        self.coordinate = coordinate
        self.name = name
        self.hint = hint
    }
    
    func signLog(_ entry: String) {
        log.append(entry)
    }
}

let cache = GeoCache(coordinate: Coordinate(latitude: 59.91126, longitude: 10.76046),
                     name: "Kristiania",
                     hint: "Rom 81")

cache.signLog("Someone was here...")
cache.signLog("I was here!")
print(cache.description)

