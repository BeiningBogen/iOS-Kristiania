# Øvingsoppgaver forelesning 7

---

## Oppgave 1

Lag en prosjekt og legg inn følgende tester.
Få testene til å gå grønn uten å modifisere verdiene i testen:

```swift
import UIKit
import XCTest

class PersonTests: XCTestCase {

     func testCreatePerson() {
        let person = Person(named: "John Doe")
        XCTAssertNotNil(person)
    }

    func testPersonWithName() {
        let person = Person(named: "John Doe")
        XCTAssertEqual(person.name, "John Doe")
    }

    func testPersonWithAge() {
        let person = Person(named: "John Doe")
        person.age = 28
        XCTAssertEqual(person.age, 28)
    }

    func testUpdatePersonName() {
        var person = Person(named: "John Doe")
        person.name = "Steve Jobs"
        XCTAssertEqual(person.name, "Steve Jobs")
    }

}
```

HINT:
Klassen du lager vil ikke automatisk bli tilgjengelig i Test target.
skriv @testable import [Navnet på prosjektet ditt]


## Oppgave 2

Lag en assertion som feiler om man kaller en metode med feil parametre.
Kjør prosjektet og valider at Xcode stopper applikasjonen der du spesifiserte asserten

## Oppgave 3

Her er en metode jeg ofte bruker for å teste at jeg parser JSON riktig. Den tar et filnavn inn og gir deg et dictionary av attributter tilbake. Lag en demo jsonfil med en enkelt attributt og bruk kall metoden fra en testmetode for å sjekke det.


```swift

func jsonAttributes(fromFileNamed name: String) -> Any {

    let path = Bundle(for: CouponGridView.self).path(forResource: name, ofType: "json")
    let data = try! Data(contentsOf: URL(fileURLWithPath: path!))

    let jsonAttributes = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
    return jsonAttributes as Any

}
```

Fyll inn for at dette skal fungere

let jsonAttributes = jsonDictionaryFromFile("person") // leser person.json fra prosjektet ditt

let person = Person(attributes:jsonAttributes)
person.name // Nikola Tesla


## Oppgave 4

Installer Cocoapods

og så installer Alamofire til prosjektet ditt

https://github.com/Alamofire/Alamofire


## Oppgave 5

Her er en Url som returnerer json:
http://jsonplaceholder.typicode.com/posts
Bruk Alamofire til å gjøre en GET til den URLen for å hente JSON. Den vil returnere et Array av Post-objekter som du skal parse

Vis så resultatet i et UITableView

Her anbefaler jeg å lage en klasse hvor du kan kalle følgende

let post = Post(attributes: jsonAttributes)

Bonus-oppgave: Lag Unit-tester hvor du tester at du parser json fra den URLen riktig. Kopier json fra URLen inn i en fil og lag testene ved å parse den på samme måte som oppgave 3
