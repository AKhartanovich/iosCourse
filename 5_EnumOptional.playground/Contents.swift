import UIKit

//““/*:
// # Вспомним:
// * Синтаксис IF-ELSE
// * Синтаксис GUARD
// * Синтаксис TERNARY
// * Синтаксис SWITCH
// * Switch + break, fallthrough
// * ENUM - https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
//
//*/
//let isIpad = true
//let new = isIpad ? 10 : 20
//
//switch new {
//    case 0...10:
//        print("1")
//        fallthrough
//    case 10...20:
//        print("2")
//    case 0...100:
//        print("3")
//    default:
//        break
//}
////raw value
//enum Payment1: Int {
//    case cash = 1
//    case gold = 20
//    case berries = 30
//}
//
//Payment1(rawValue: 20)
//
//typealias Weight = Double
//
////associated value
//enum Payment {
//    case cash (Double)
//    case gold (Weight)
//    case berries (Int, Int)
//}
//
//let goldPayment = Payment.gold(100)
//    let paymentType = Payment1.gold
//    let paymentAmount = 100
//
//let newPayment = Payment.cash(1000.5)
//
//
//func getPayment(payment: Payment) {
//    switch payment {
//        case .cash(let value):
//            print("Get cash: \(value)")
//        case .berries(var x, let y):
//            print("berries")
//        case .gold(var xxx):
//            print("Get gold: \(xxx)")
//    }
//}
//getPayment(payment: goldPayment)
//
//
///*: ## Switch advanced
// * switch + value binding
// */
//
///*:
// # 5 Enumerations + Optionals
//
// * ENUM advanced - https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
// * Optionals
//*/
//enum CustomOptional<T> {
//    case some (T)
//    case none
//}
//
//enum AnyOptional {
//    case some (Any)
//    case none
//}
//
//struct SSS {
//}
//
//let co = CustomOptional.some(0.0)
//let ao = AnyOptional.some(0.0)
//
//
////: ## Enum
//
//// CaseIterable
////enum Beverage: CaseIterable {
////    case coffee, tea, juice
////}
//
////for beverage in Beverage.allCases {
////    print(beverage)
////}
//
//// Raw values
////enum Planet: Int {
////    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
////}
////let possiblePlanet = Planet(rawValue: 7)
//
//
///*:
// ## Optionals
// * [Documentation](https://developer.apple.com/documentation/swift/optional)
// * [Source code](https://github.com/apple/swift/blob/master/stdlib/public/core/Optional.swift)
// ### What is optional?
// */
//var optionalInt: Int? = 0
//
//switch optionalInt {
//    case .some(let value):
//        print(value)
//    case .none:
//        break
//}
//
//
//print(optionalInt)
//
//func printNonOptional(value: Int){
//    print(value)
//}
//
////: ### Unwrapping
////what is unwrapping
//
////:* using if-statement
//var result: Int = 0
////result = optionalInt + 1
//
//if let nonOptional = optionalInt {
//    nonOptional
//} else {
//    print("Warning! No data")
//}
////nonOptional
//func method() {
//    guard let nonOptional = optionalInt else { return }
//
//    print(nonOptional)
//}
//
//func sellItemFor(money: Double?) {
//    guard let money = money else { return }
//
//    if money < 10 {
//        // sell 1
//    } else {
//
//    }
//}
//
////: * Optional binding
////if let
//if let nonOptional = optionalInt {
//    printNonOptional(value: nonOptional)
//} else {
////    nonOptional
//}
//
//// Caution! Careful with structs
//
////guard let
//optionalInt = 11
//func guardlet() {
//    guard let nonOptional = optionalInt else {
//        return
//    }
//    nonOptional
//}
//
//guardlet()
////: * Optional chaining
//if let optInt = optionalInt {
//    optInt.distance(to: 100)
//}
//
//optionalInt?.distance(to: 100)
//
//
//class Cat {
//    var numberOfLegs: Int? = 4
//    func bite() {
//        print("Bite")
//    }
//}
//
//var myCat: Cat? = Cat()
//myCat?.bite()
////myCat = nil
//myCat?.bite()
//myCat?.numberOfLegs?.distance(to: 1)
//
////: * nil-coalescing operator
//print(optionalInt ?? "there is nil")
//let nonOptional2 = optionalInt ?? 555
//
//
//let newInt: Int = optionalInt ?? 0
//
////: * Force(unconditional) unwrap
//let nonOptionalForced = optionalInt!
//
//if optionalInt != nil {
//
//}
//
//if let nonOpt = optionalInt {
//    print("smth")
//}
//
//let newInt2 = optionalInt!
//
//




//: ## Задание:
//: * [App Development with Swift](https://books.apple.com/by/book/app-development-with-swift/id1465002990) **Units 1.1-1.4 + Units 2.1-2.5**

//: ### Практика:
// 1. Придумать ENUM к которому можно применить rawValue (не Error), другой к которому можно применить Associated Values (не из примеров с занятия)
print("Задание 1")
enum Planet: Int {
    case mercury = 1
    case venus = 2
    case earth = 3
    case mars = 4
    case jupiter = 5
    case saturn = 6
    case uranus = 7
    //неявное указание rawValue, автоматически будет присвоено значение 8
    case neptune
}
let myPlanet = Planet.jupiter
func planetToTheSun(planet: Planet?){
    guard let planet = planet else { return }
    switch planet {
    case .mercury :
        print("Меркурий это 1 планета от солнца")
    case .venus:
        print("Венера это 2 планета от солнца")
    case .earth:
        print("Земля это 3 планета от солнца")
    case .mars:
        print("Марс это 4 планета от солнца")
    case .jupiter:
        print("Юпитер это 5 планета от солнца")
    case .saturn:
        print("Сатурн это 6 планета от солнца")
    case .uranus:
        print("Уран это 7 планета от солнца")
    case .neptune:
        print("Нептун это 8 планета от солнца")
    }
}
let myPlanetToTheSun: () = planetToTheSun(planet: myPlanet)
myPlanet.rawValue

enum IdentificationPerson{
    case name(String)
    case surname(String)
    case serialNumber(String, Int)
}

var myPerson = IdentificationPerson.name("Александр")
func IdentificationPersonWith(param: IdentificationPerson?){
    if let param = param {
        switch param {
        case .name(let value):
            print("Идентификация по имени: \(value)")
        case .surname(let value):
            print("Идентификация по фамилии: \(value)")
        case .serialNumber(let serial, let number):
            print("Идентификация по серии номеру: \(serial)\(number)")
        }
    }
    else {
        print("Данные для идентификации отсутствуют!")
    }
}

let myIdentificationPerson1: () = IdentificationPersonWith(param: myPerson)
myPerson = IdentificationPerson.surname("Khartanovich")
let myIdentificationPerson2: () = IdentificationPersonWith(param: myPerson)
myPerson = IdentificationPerson.serialNumber("MC", 1234567)
let myIdentificationPerson3: () = IdentificationPersonWith(param: myPerson)



// 2. Создать опционалы типов Int, Double, String + какого-то своего класса, а также применить все виды разворачивания: Optional Binding, Optional chaining, nil-coalesing (??)
//Здесь я вроде все уместил
print("Задание 2")

struct BMW {
    var engine: String?
    var power: Int?
    var acceleration: Double?
    func printInfo() {
        guard let engine = self.engine,
            let power = self.power,
            let acceleration = self.acceleration else {return}
        print(engine,power,acceleration)
    }
    func vrumVrum() {
        print(engine ?? "Engine don`t known")
    }
}
let myBmw: BMW? = BMW(engine: "V8", power: 286, acceleration: 6.5)
myBmw?.printInfo()
myBmw?.vrumVrum()
myBmw?.acceleration?.distance(to: 300)
let myNewBmw: BMW? = BMW(engine: nil, power: nil, acceleration: nil)
myNewBmw?.printInfo()
myNewBmw?.acceleration?.distance(to: 100)
myNewBmw?.vrumVrum()



// 3. Описать с помощью ENUM погодные явления, сопроводить(где возможно) associated values

enum WeatherConditios {
    case wind(description: String,level: HazardLevel)
    case cloud(description: String,level: HazardLevel)
    case rain(description: String,level: HazardLevel)
    case fog(description: String,level: HazardLevel)
    case storm(description: String,level: HazardLevel)
    case blizzard(description: String,level: HazardLevel)
}

enum HazardLevel {
    case eazy
    case medium
    case hard
}

let localWeather = WeatherConditios.wind(description: "Ветренно но не критично", level: .eazy)

func printLocal(weather: WeatherConditios) {
    switch weather {
    case .wind(description: let description, level: let level):
        print("\(description), уровень опастности \(level)")
    case .cloud(description: let description, level: let level):
        print("\(description), уровень опастности \(level)")
    case .rain(description: let description, level: let level):
        print("\(description), уровень опастности \(level)")
    case .fog(description: let description, level: let level):
        print("\(description), уровень опастности \(level)")
    case .storm(description: let description, level: let level):
        print("\(description), уровень опастности \(level)")
    case .blizzard(description: let description, level: let level):
        print("\(description), уровень опастности \(level)")
    }
}

let someWeather: () = printLocal(weather: localWeather)

//: ### Advanced:
//: * https://www.hackerrank.com/


