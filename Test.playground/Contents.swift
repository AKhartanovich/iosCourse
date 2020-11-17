//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport




//: # 1. (1 балл за каждый пункт)

//: ### 1.1 Что такое значимый (value) и  ссылочный(reference) тип? Приведите примеры.

/*
 Значимый тип данных означает, что значение копируется при присвоении его переменной или константе, ну или в функцию. Ну и выделяется при этом новая область памяти для значения.
 Например:
 */
struct PersonStruct {
    var Name: String
    var Age: Int
}
var myPerson1 = PersonStruct(Name: "Alexander", Age: 27)
var myPerson2 = myPerson1
myPerson2.Name = "Sasha"
//print(myPerson1.Name)
//print(myPerson2.Name)
/*
 Ссылочный тип данных означает, что при обьявлении ссылочной переменной образуется ссылка на определенную облдасть в памяти. При этом если на данную область памяти ссылается несколько обьектов, то при изменеии значения оно поменяется у всех обьектов
    Например:
 */
class PersonClass {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
}
var myPersonClass1 = PersonClass(name: "Alexander", age: 27)
var myPersonClass2 = myPersonClass1
myPersonClass2.name = "Sasha"
//print(myPersonClass1.name)
//print(myPersonClass2.name)

//: ### 1.2 Чем отличается “struct“ от “class”?
/*
 Структура является значимым типом данных, также в ней нет наследования.
 Класс является ссылочным типом данных. В нем есть наследование и еще много разных фич. Как рекомендует документация свифта в 99% случаях нужно использовать классы.
 Пример есть выше
 */

//: ### 1.3 Что такое Опционал(optional value)? Какие способы “unwrapping” для опционала вы знаете?

/*
 Опционал это такой тип данных который может не иметь значения вовсе (nil). Например опциональный инт и обычный инт это два разных типа данных. Для этого существуют способы извлечения опционального типа данных Optional Binding, Optional chaining, nil-coalesing, force Unwraping(Но ты запретил до конца курса этим пользоваться поэтому пример не сделаю)
 */
//Optional Binding
let name: String? = "Alexander"
if let name = name {
//    print(name)
}
else {
//    print("Nil")
}

//nil-coalesing
let age: Int? = 20
func printAge(){
//    print(age ?? "No data")
}
printAge()
//Optional chaining
struct Car {
    var name: String?
}
let myCar: Car? = Car(name: "BMW")
myCar?.name?.count

//: ### 1.4 Какие Коллекции(Collection types) вы знаете? Приведите примеры использования каждого из них(т.е. какую коллекцию для каких задач рациональнее использовать).
/*
 Существуют такие коллекции как массив, кортеж, наборы, словари
 массивы нужно использовать когда нужна упорядоченная коллекция элементов одного типа
 кортеж содержит значения различных типов
 набор это неупорядоченная коллекция уникальных элементов
 словарь это тоже неупорядоченная колекция, но доступ к ее данным осуществляется с помощью индектов
 */
var array: Array<Int> = []
array.append(1)
array.append(3)
array.append(5)
array.append(4)
array[2]

var tuple = (123,"Sasha",true)
tuple.0

var set: Set<Int> = []
set.insert(10)
set.insert(1)
set.insert(78)
set.contains(10)

var modelCar: Dictionary<String, String> = [:]
modelCar["BMW"] = "520"
modelCar["Audi"] = "A6"
modelCar

//: ### 1.5 Что такое замыкание(Closure)? Приведите примеры использования.
/*
 Замыкания это блок кода, который может быть передан в качестве аргумента функции и множество раз использован
 */
func operationWith(num1: Int, num2: Int, closure: (Int, Int)->Int){
    closure(num1,num2)
}
operationWith(num1: 10, num2: 1) { $0 + $1 }

//: ### 1.6 Что такое enum? Что такое raw и associated value?

/*
 Короче, обьяснить трудно)) но в целом enum это тип для группы связанных значений.
 associated value - с ним мы можем ассоциировать какое нибудь другое значение определенного типа
 Raw value - те член перечесления может иметь фиксированное значение
 */

//: ### 1.7 Как вы понимаете основные понятия/принципы ООП: Наследование, инкапсуляция, полиморфизм? Приведите примеры.

/*
 Класс в свифте может наследовать другой класс, тем самым получать доступ к свойствам методам суперкласса. Также дочерний класс может переопределять функционал методов и свойств суперкласса.
 Например:
 */
class Person {
    var name: String
    var surname: String
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    func getInfo() -> String {
        "\(self.name) \(self.surname)"
    }
}

class Employee: Person {
    var company: String
    init(name:String,surname:String,company: String) {
        self.company = company
        super.init(name: name, surname: surname)
    }
    override func getInfo() -> String {
        "\(self.name) \(self.surname) worked in \(self.company)"
    }
}
var employee: Employee = Employee(name: "Sasha", surname: "Khartanovich", company: "BGS")
//print(employee.getInfo())

//Инкапсулятия это когда мы можем обьеденить данные и методы в классе и скрыть детали реализации от пользователя

class Vehicle {

    let torque: UInt

    let weight: UInt

    private lazy var acceleration: Double = {
        return Double(self.torque) / Double(self.weight)
    }()

    init(torque torqueVehicle: UInt, weigth weightVehicle: UInt) {
        self.torque = torqueVehicle
        self.weight = weightVehicle
    }

    func move(distanse: UInt) {
        let time = sqrt((2*Double(distanse)) / self.acceleration)
//        print("Vehicle moved distance \(distanse) meters in \(time) seconds")
    }
}

//Полиморфизм это когда создается несколько обьектов с одинаковым интерфейсом, но информации о типе и внутреней реализации нет.
//Выше в наследовании приведен пример как наследования так и полиморфизма

//: ### 1.8 Для чего существуют операторы "if" и "switch"? Чем они отличаются?

/*
 If проверяет некое условие и взависимости от того является ли результат проверки ложью или правдой выпорлнит какое-то действие
 Switch тоже проверяет условие, но позволяет обрабатывать сразу несколько условий.
 Отличий достаточно много, Switch должен проверить полный диапазон проверяемого значения. Он быстрее так как ничего решать и проверять не нужно -  пришло значение на него стал и выполнил действие.
 */
//: ### 1.9 Что такое Extension и Protocol. Для чего они предназначены? Какие принципы ООП они реализовывают?
/*
 Extension добавляют новую функциональность к существующим классом, структорам, протоколам или перечеслениям.
 при  помощи расширений можно добовлять вычисляемые свойства, определять методы класса, предоставлять новые инициализаторы, определять новые вложеные типы. Расширения не могут изменить уже существующую функциональность класса или чего то. К примеру есть клас UIColor в котором неудобно вносить RGB. Мы можем расширить этот класс и написать в нем функцию которая упростит задачу установки цвета обьектам
 Протокол определяет методы, свойства и другие требования, который должен реализовать тип, те эти требования должны быть обязательно описаны в типе, если наследуется данный протокол. Протокол может наследовать другие протоколы, также протокол можно расширить.
 */
//: # 2. (2 балла за каждый пункт)
//:  2.1 Опишите enum который будет отражать общие состояния погоды(ясно, облачно, осадки и тд). Для тех состояний погоды, для которых возможно, опишите assosiated values с количеством осадков.

enum WeatherConditios {
    case wind(description: String,level: HazardLevel)
    case cloud(description: String,level: HazardLevel, precipitation: Precipitation)
    case rain(description: String,level: HazardLevel, precipitation: Precipitation)
    case fog(description: String,level: HazardLevel, precipitation: Precipitation)
    case storm(description: String,level: HazardLevel, precipitation: Precipitation)
    case blizzard(description: String,level: HazardLevel)
}

enum HazardLevel {
    case eazy
    case medium
    case hard
}

enum Precipitation {
    case value (Int)
}

let localWeather = WeatherConditios.rain(description: "Мерзко", level: .medium, precipitation: .value(80))

//func printLocal(weather: WeatherConditios) {
//    switch weather {
//    case .wind(description: let description, level: let level):
//        print("\(description), уровень опастности \(level)")
//    case .cloud(description: let description, level: let level, precipitation: let value):
//        print("\(description), уровень опастности \(level), уровень осадков \(value)")
//    case .rain(description: let description, level: let level, precipitation: let value):
//        print("\(description), уровень опастности \(level), уровень осадков \(value)")
//    case .fog(description: let description, level: let level, precipitation: let value):
//        print("\(description), уровень опастности \(level), уровень осадков \(value)")
//    case .storm(description: let description, level: let level, precipitation: let value):
//        print("\(description), уровень опастности \(level), уровень осадков \(value)")
//    case .blizzard(description: let description, level: let level):
//        print("\(description), уровень опастности \(level)")
//    }
//}
//printLocal(weather: localWeather)

//:  2.2 Опишите функцию minValue, которая принимает 2 аргумента и возвращает меньшее из этих значений.

func minValue(num1: Int, num2: Int) -> Int{
    let result = num1 < num2 ? num1 : num2
    return result
}
minValue(num1: 3, num2: 5)

//:  2.3 Для следующего объекта типа String выведите все строки короче 10 символов, которые начинаются на "a" или "A" и все строки начинающиеся на b или "B"
let strings = ["adfkjsd", "Akdsfjkdfjldfjk", "bdkk", "kaf", " afurl", "ABBA", "ABBBBBBBBBBBBBBBBA", "no", "1234566dkjdksdjksd", "bbbbbbbbbbbbbbbbbbbb", "Ваc?"]
var filterStrings = strings.filter { (el) -> Bool in
    el.count < 10 && (el[el.startIndex] == "a" || el[el.startIndex] == "A" || el[el.startIndex] == "b" || el[el.startIndex] == "B")
}
//print(filterStrings)

//:  2.4 Опишите функцию, которая принимает номер дня недели и возвращает название дня недели.

//func dayOf(week: Int){
//    guard week > 7 else {return}
//    enum Week {
//        case monday
//        case tuesday
//        case wednesday
//        case thursday
//        case friday
//        case saturday
//        case sunday
//    }
//    switch week {
//    case 1 :
//        print(Week.monday)
//    case 2 :
//        print(Week.tuesday)
//    case 3 :
//        print(Week.wednesday)
//    case 4 :
//        print(Week.tuesday)
//    case 5 :
//        print(Week.friday)
//    case 6 :
//        print(Week.saturday)
//    case 7 :
//        print(Week.sunday)
//    default:
//        print("WTF!?!?")
//    }
//}
//
//dayOf(week: 3)

//:  2.5 Опишите функцию, которая получает время в качестве трех аргументов (часы, минуты, секунды) и возвращает время в качестве (с тремя этими компонентами). С помощью typealias можете назвать исходящий тип по-своему.

func timeInTuple(hour: Int, minutes: Int, secondes: Int) -> (Int,Int,Int) {
    (hour,minutes,secondes)
}
timeInTuple(hour: 1, minutes: 2, secondes: 30)

//: 2.6 Опишите функцию, принимающую время в виде кортежа, описанного в предыдущем задании, конвертирует полученное время в секунды и возвращает значение Int(количество секунд)

func timeInSecond(time: (Int,Int,Int)) -> Int{
    (time.0 * 3600) + (time.1 * 60) + (time.2)
}
timeInSecond(time: (1,2,30))

//:  2.7 Опишите функцию обратную функции из предыдущего задания, принимающую 1 аргумент - количество секунд(например 1500) и конвертирует полученное время в формат кортежа (часы, минуты, секунды) из пункта 2.5

func secondsToHoursMinutesSeconds(seconds : Int) -> (Int, Int, Int) {
    (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

secondsToHoursMinutesSeconds(seconds: 3750)

//:  2.8 Объявите переменную которая будет иметь тип Closure(замыкание), которое принимает аргументы Int и String и возвращает массив String. Присвойте ей реализацию, которая повторит в массиве строку n раз. Выполните эту функцию, передав ей число 7 и строку "test".

var closure: (Int, String) -> [String] = {(number, text) -> [String] in
    let result: Array<String> = Array(repeating: text, count: number)
    return result
}

//print(closure(7, "test"))

//:  2.9 Используя функцию `filter', получите массив только с городами с населением более 15 млн человек

struct City {
    let population: Int
    let country: String
    let name: String
}

let citiesArray = [City(population: 24_256_800, country: "Китай", name: "Шанхай"),
City(population: 23_500_000, country: "Пакистан", name: "Карачи" ),
City(population: 21_516_000, country: "Пекин", name: "Китай"),
City(population: 16_349_831, country: "Индия", name: "Дели"),
City(population: 16_060_303, country: "Нигерия", name: "Лагос"),
City(population: 15_200_000, country: "Китай", name: "Тяньцзинь"),
City(population: 14_160_467, country: "Турция", name: "Стамбул"),
City(population: 13_513_734, country: "Япония", name: "Токио"),
City(population: 13_080_500, country: "Китай", name: "Гуанчжоу"),
City(population: 12_442_373, country: "Индия", name: "Мумбаи"),
City(population: 12_197_596, country: "Россия", name: "москва"),
City(population: 11_895_893, country: "Бразилия", name: "Сан-Паулу"),
City(population: 10_467_400, country: "Китай", name: "Шэньчжэнь"),
City(population: 10_075_310, country: "Индонезия", name: "Джакарта"),
City(population: 10_052_000, country: "Пакистан", name: "Лахор"),]

var filtredArray = citiesArray.filter { $0.population > 15_000_000 }
//print(filtredArray)

//: # 3. (5 баллов за каждый пункт)
//: ### Представьте себе задачу по разработке приложения для домашней климатической техники. В рамках данной задачи вам необходимо выполнить следующее:
/*:
 3.1 Опишите базовый класс HomeSensor, который содержит несколько общих свойств для разных датчиков (например: датчик влажности, температуры, CO2):
 - p значение измеряемого параметра данным датчиком value,
 - p название измеряемого параметра,
 - p целевое значение параметра - идальный показатель (targetValue),
 - точность в процентах (погрешность датчика),
 - id датчика
 - Опишите Void(Ничего не возвращающую) функцию "output" с пустым телом (т.е. что бы она ничего не делала)

 3.2 Опишите наследуемые классы для каждого типа датчиков (HumiditySensor, TemperatureSensor, COSensor)
 3.3 В дочерних классах переопределите функцию Output, что бы она выводила описание типа "Температура на датчике 13 равна 15ºС +/- 1ºС. Целевое значение - 19ºС"

 3.4 Опишите класс для комнаты(Room), который может содержать несколько сенсоров(HomeSensor) в одном свойстве c названием sensors. Так же Room должно содержать свойство - название комнаты.
 3.5 Опишите класс Home, который может содержать несколько комнат(Room) в одном свойстве c названием rooms, а также опишите в нем функцию, которая выводит в консоль показания всех датчиков в каждой комнате, используя метод output
 */
class HomeSensor {
    private var targetValue: Int
    var value: Int = 0 {
        didSet {
            if value > targetValue {
                value = targetValue
                print("Превышает целевое значение! Установлена целевая величина равная \(targetValue)")
            }
        }
    }
    var targetValueMin: Int = 0 {
        didSet {
            if targetValue < targetValueMin {
                targetValue = targetValueMin
            }
        }
    }
    var targetValueMax: Int = 0 {
        didSet {
            if targetValue > targetValueMax {
                targetValue = targetValueMax
            }
        }
    }
    private var paramName: String
    private var accurasy: Int
    private var ID: Int
    
    init(paramName: String, targetValue: Int, accurasy: Int, Id: Int) {
//        self.value = value
        self.paramName = paramName
        self.targetValue = targetValue
        self.accurasy = accurasy
        self.ID = Id
    }
    
    func output() -> String{
        let result = " на датчике \(ID) равна \(value)\(paramName) +/- \(accurasy)\(paramName). Целевое значение - \(targetValue)\(paramName)"
        return result
    }
    
    func inputValueIn(targetMin: Int, targetMax: Int){
        self.targetValueMin = targetMin
        self.targetValueMax = targetMax
    }
}


class HumiditySensor: HomeSensor {
    var name: String
    var nameSensor: String
    init(name: String ,nameSensor: String ,value: Int, paramName: String, targetValue: Int, targetValueMin: Int, targetValueMax: Int, accurasy: Int, Id: Int) {
        self.nameSensor = nameSensor
        self.name = name
        super.init(paramName: paramName, targetValue: targetValue, accurasy: accurasy, Id: Id)
        super.value = value
        super.targetValueMin = targetValueMin
        super.targetValueMax = targetValueMax
    }
    override func output() -> String {
        return name + super.output()
    }
}

class TemperatureSensor: HomeSensor{
    var name: String
    var nameSensor: String
    init(name: String ,nameSensor: String ,value: Int, paramName: String, targetValueMin: Int, targetValueMax: Int, targetValue: Int, accurasy: Int, Id: Int) {
        self.nameSensor = nameSensor
        self.name = name
        super.init(paramName: paramName, targetValue: targetValue, accurasy: accurasy, Id: Id)
        super.value = value
        super.targetValueMin = targetValueMin
        super.targetValueMax = targetValueMax
    }
    override func output() -> String {
        return name + super.output()
    }
}

class COSensor: HomeSensor{
    var name: String
    var nameSensor: String
    init(name: String ,nameSensor: String ,value: Int, paramName: String, targetValueMin: Int, targetValueMax: Int, targetValue: Int, accurasy: Int, Id: Int) {
        self.nameSensor = nameSensor
        self.name = name
        super.init(paramName: paramName, targetValue: targetValue, accurasy: accurasy, Id: Id)
        super.value = value
        super.targetValueMin = targetValueMin
        super.targetValueMax = targetValueMax
    }
    override func output() -> String {
        return name + super.output()
    }
}

class Room {
    var sensors: Array<HomeSensor> = []
    var nameRoom: String
    
    init(nameRoom: String) {
        self.nameRoom = nameRoom
    }
    
    func appendSensorInArray(sensor: HomeSensor){
        self.sensors.append(sensor)
    }
    
    func printRoomName(){
        print(nameRoom)
    }
}

class Home{
    var rooms: Array<Room> = []
    var addressHome: String
    
    init(addressHome: String){
        self.addressHome = addressHome
    }
    
    func appendRoomsInHome(room: Room) {
        self.rooms.append(room)
    }
    
    func infoAboutAllSensors() {
        for room in rooms {
            for sensor in room.sensors {
                print(room.nameRoom)
                print(sensor.output())
            }
        }
    }
}

var myHome: Home = Home(addressHome: "Cherven, Timiryazeva")
var kitchen: Room = Room(nameRoom: "Кухня")
var bedroom: Room = Room(nameRoom: "Спальня")
var livingRoom: Room = Room(nameRoom: "Гостинная")

myHome.appendRoomsInHome(room: kitchen)
myHome.appendRoomsInHome(room: bedroom)
myHome.appendRoomsInHome(room: livingRoom)

var humiditySensorInKitchen: HumiditySensor = HumiditySensor(name: "Влажность", nameSensor: "Датчик влажности", value: 10, paramName: "%", targetValue: 0, targetValueMin: 20, targetValueMax: 60, accurasy: 5, Id: 1)
var temperatureSensorInKitchen: TemperatureSensor = TemperatureSensor(name: "Температура" ,nameSensor: "Датчик температуры", value: 18, paramName: "ºС", targetValueMin: 15, targetValueMax: 28, targetValue: 22, accurasy: 1, Id: 2)
var COSensorInKitchen: COSensor = COSensor(name: "CO", nameSensor: "Датчик СО", value: 220, paramName: "ppn", targetValueMin: 0, targetValueMax: 420, targetValue: 400, accurasy: 10, Id: 3)
var humiditySensorInBedroom: HumiditySensor = HumiditySensor(name: "Влажность",nameSensor: "Датчик влажности", value: 20, paramName: "%", targetValue: 40, targetValueMin: 20, targetValueMax: 80, accurasy: 5, Id: 4)
var temperatureSensorInBedroom: TemperatureSensor = TemperatureSensor(name: "Температура" ,nameSensor: "Датчик температуры", value: 18, paramName: "ºС", targetValueMin: 28, targetValueMax: 28, targetValue: 22, accurasy: 1, Id: 5)
var COSensorInBedroom: COSensor = COSensor(name: "CO",nameSensor: "Датчик СО", value: 220, paramName: "ppn", targetValueMin: 400, targetValueMax: 0, targetValue: 440, accurasy: 10, Id: 6)
var humiditySensorlivingRoom: HumiditySensor = HumiditySensor(name: "Влажность",nameSensor: "Датчик влажности", value: 20, paramName: "%", targetValue: 40, targetValueMin: 10, targetValueMax: 80, accurasy: 5, Id: 7)
var temperatureSensorlivingRoom: TemperatureSensor = TemperatureSensor(name: "Температура" ,nameSensor: "Датчик температуры", value: 18, paramName: "ºС", targetValueMin: 15, targetValueMax: 28, targetValue: 22, accurasy: 1, Id: 8)
var COSensorlivingRoom: COSensor = COSensor(name: "CO",nameSensor: "Датчик СО", value: 220, paramName: "ppn", targetValueMin: 0, targetValueMax: 440, targetValue: 400, accurasy: 10, Id: 9)
kitchen.appendSensorInArray(sensor: humiditySensorInKitchen)
kitchen.appendSensorInArray(sensor: temperatureSensorInKitchen)
kitchen.appendSensorInArray(sensor: COSensorInKitchen)
bedroom.appendSensorInArray(sensor: humiditySensorInBedroom)
bedroom.appendSensorInArray(sensor: temperatureSensorInBedroom)
bedroom.appendSensorInArray(sensor: COSensorInBedroom)
livingRoom.appendSensorInArray(sensor: humiditySensorlivingRoom)
livingRoom.appendSensorInArray(sensor: temperatureSensorlivingRoom)
livingRoom.appendSensorInArray(sensor: COSensorlivingRoom)

myHome.infoAboutAllSensors()


/*:
 Продемонстрируйте работу:
 - Создайте 1 экземпляр класса Home и  3 экземпляра Room (кухня, гостинная, спальня). Добавьте созданные экземпляры комнат в объект Home (в проперти rooms объекта Home)
 - Создайте и добавьте несколько экземпляров датчиков в каждую комнату
 - У объекта Home вызовите функцию, которая выводит в консоль показания всех датчиков в каждой комнате
 */


//: Дополнительное задание:
/*:
 Для каждого датчика:
 - опишите дополнительное значение нижнего предела targetValueMin
 - опишите метод, устанавливающий targetValueMin и targetValueMax, предусмотрите валидацию введенного значения (что бы с точки зрения контекста каждого измерения не нарушалась логика)
 - в didSet проперти value предусмотрите сообщение в консоль в случае если новое значение больше, чем targetValue
 */

