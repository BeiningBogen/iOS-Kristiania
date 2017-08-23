import UIKit

/*:

# Øvingsoppgaver forelesning 1


#### Oppgave 1

  Definer en konstant med “Swift er fett!”.
- Forsøk å sette verdien til noe annet.
- Hvorfor fikk du feilmelding nå?
- Endre koden slik at du kan endre verdien uten å få feilmelding

*/


/*:
## Oppgave 2

Lag en konstant med en eksplisitt String type og verdien “iOS FTW” - Fjern deretter typen. Hvorfor er dette mulig?

*/


/*:
## Oppgave 3

Lag en numerisk konstant og en streng konstant, lag deretter en konstant som innholder begge.
Gjennomfør dette både med string interpolering og uten.

*/


/*:
## Oppgave 4

Lag et utrykk med string interpolering der du regner ut summen av 5 * 120 som en del av interpoleringen, skriv dette ut ved hjelp av println

*/


/*:
## Oppgave 5

Sammenlign to strenger og print “de er like”, om de er helt like, eller “de er forskjellige” om de er ulike

*/


/*:
## Oppgave 6

Lag en tuple med innholdet (5600, “iOS programmering”). Bruk deretter println for å skrive ut “PG5600 - iOS programmering”
*/



/*:
## Oppgave 7

Lag en loop der du skriver ut hver ord i en array på egen linje
Lag deretter en loop som printer ut hver enkelt bokstav i hvert ord på en ny linje


Forventet resultat
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
## Oppgave 8

Lag en dictionary med 5 key-value par, loop over den og skriv ut key og value med print

*/



/*:
## Oppgave 9

Lag et nytt iOS prosjekt i Xcode av typen “Single View Application”.
1. Finn det stedet som kalles når applikasjonen starter opp
2. Definer opp streng konstanter for title, beskjed og knapp.
3. Lag et UIAlertView som bruker konstantene du har definert.
4. Kall en metode .show på alert view instansen.
5. Kjør simulatoren og verifiser at tekststrengen dukker opp.
*/


//:## Oppgave 10

//:Du har fått disse to objektene med data fra et API, dessverre har det kommet med litt andre verdier i array,
//:men index og antall launches er fortsatt riktig - Falcon 9 har 19 launches, Atlas V har 55, osv.
let rockets : [Any?] = ["Falcon 9", nil, -999, nil, "Atlas V", nil, "Space Shuttle", nil, "My Water bottle-rocket"]
let numberOfLaunches = [19, 55, 135, 1]

//:    Gå gjennom rockets og skriv rakettenes navn og antall launches på formatet
//:    Falcon 9 : 55 launches
//:    ...
//:    My water bottle-rocket : 1 launch        // merk dropp genitivs-s når det er kun 1 launch



/*:
## Oppgave 11

Denne oppgaven er ekstra utfordrende og må løses utenfor playground. I terminalen, kjør først:

xcode-select -s /Applications/Xcode-beta.app/Contents/Developer

Slik at du kan kjøre swift fra kommandolinjen.

Lag deretter en fil “langauges.txt” med innholdet:

Swift
Java
Objective-C
Python

Lag deretter en fil kalt “swiftsort.swift” med følgede innhold:

#!/usr/bin/env xcrun swift
import Cocoa
print(“Hello world”)

For å gjøre denne kjørbar fra terminalen, skriver du

chmod +x swiftsort

Prøv å kjøre applikasjonen med

./swiftsort

Du skal nå se "Hello world" i terminalen. Oppgaven videre er å oppdatere swiftsort slik at

cat languages.txt | ./swiftsort

Vil skrive ut:

Java, Objective-C, Python, Swift

*/
