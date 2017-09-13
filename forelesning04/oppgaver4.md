Øvingsoppgaver forelesning 4
================

Oppgave 1
----------------

Gjenskap applikasjonen fra forelesningen ved hjelp av storyboards og segues, hvor:

* En melding i første view skal kunne skrives inn (maskert, som et passord)
* Vises i det andre viewet når man trykker "Send melding", slik at "Placeholder" byttes ut med den faktiske meldingen

![](img/vc-communication2.png)


Oppgave 2
------

Løs oppgave 1 uten bruk av seques (opprett view controller manuelt fra storyboard)


Oppgave 3
----------------

Fortsett på oppgave 2. "Pakk inn" de eksiterende content view controllerne i en Navigation controller. Dette gjør du ved å velge den første view controlleren og Editor -> Embed in -> Navigation controller.

Du vil få en tittellinje og tilbakenavigasjon. Legg inn titler slik at resultatet blir:

![](img/nav1.png)

![](img/nav2.png)


Oppgave 4
----------------

* Utvid appen med en "Åpne i Safari" knapp på meldingsskjermen.
* Knappen skal bare vises dersom meldingen er en gyldig URL som starter med http:// eller https://
* Når man trykker på knappen, skal Safari åpnes med denne URLen

![](img/open-safari.png)

![](img/open-safari2.png)

Oppgave 5
----------------


Lag en tredje knapp som går til DestinationViewController, men istedetfor å vise teksten, åpner en UIAlertViewController med tittel lik teksten som ble skrevet inn i tekstfeltet, og en OK-knapp som lukker alertcontrolleren.

Hint: Lag en ny segue med annen identifier og sjekk segue.identifier for å vite hvem som ble brukt.

![](img/segue.png)
