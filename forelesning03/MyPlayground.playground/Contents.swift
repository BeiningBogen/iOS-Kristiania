//: Playground - noun: a place where people can play

import Foundation
import UIKit


//class EnKlassemedSubscript {
//
//    subscript (<parameters>) -> <return type> {

//# Kontrutører

let a = ""

class LivingThing {

    let birth: Date

    init(birth: Date) {

        self.birth = birth

    }

     var description: String {

        return "i am a living thing with birth: \(birth)"
    }
}

let livingThing = LivingThing(birth: Date())
livingThing.description

class Person : LivingThing {

    let firstName: String
    let middleName: String = "Mats"

    init(firstName: String) {

        self.firstName = firstName
        super.init(birth: Date())
    }

    override var description: String {

        return "i am a person with birth: \(birth)"
        
    }

}

class Student: Person {

    var computer: Computer?

    override var description: String {

       return firstName

    }

}

enum Computer {

    case mac
    case pc

}

let person = Person(firstName: "Håkon")

let student = Student(firstName: "Test").middleName


print(student)

//Perso



//class LivingThing {
// convenience init


// Arv


// Optional chaining

class School {

    let students = [Student]()

}

let school: School? = School()

if let actualComputer = school?.students.first?.computer {

} else {

    print("could not find firstname")

}

class MyButton : UIButton {

    override var debugDescription: String {

        return "My button!"
        
    }

    override var description: String {

        return "My button!"

    }
    
}
var anyArray = [Any]()

anyArray.append("Hei")
anyArray.append(8)
anyArray.append(Date())
anyArray.append(MyButton())








for element in anyArray {

    switch element {
    case let string as String:
        print(string)
        break
    case let intValue as Int:
        break
    case let doubleValue as Double:
        print(doubleValue)
        break
    case is String:
        print("was string")
        break

    default:
        print(element)
        break
    }


}




// type casting
// as 
// is


// Any

// guard
// extension
// protcols



//generics MyClass<T> {
 // var object: T

infix operator 〠

func 〠 (left: Student, right: Student) -> Student
{
    return left
}

let student1 = Student(firstName: "Tom")
let student2 = Student(firstName: "Eva")

student1 〠 student2



