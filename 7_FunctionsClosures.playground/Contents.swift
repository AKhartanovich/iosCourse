/*:
 # Look back:
 * If, guard, switch
 * Optionals
 * Struct, Class
 * Types
 *

 */

//enum Move {
//    case go(Int)
//    case turn(Direction)
//
//    enum Direction {
//        case left, right, turnBack
//    }
//}
//
//let movement = Move.go(3)
//
//switch movement {
//    case .go(let numberOfSteps):
//        for _ in 0...numberOfSteps {
//            //move()
//        }
//    case .turn(let direction):
//
//}

/*:
 # Lecture 7
 # Functions, Closures

 * Введение в функции и замыкания
*/

//: ## Functions
// Define
func functionName (id index: Int, param2: Double) -> Int {
  //body of the function
    return index
}

var function = functionName
var result = functionName(id: 1, param2: 12.1)
function(1, 1.2)

functionName(id: 1, param2: 1)


func printOnScreen(_ value: Int = 1) {
//    print(value)
}
printOnScreen(11)

func fullTank(amount: Double = 100.0) {

}

fullTank()

class CustomType {}

func configureInterface(config: CustomType? = nil) {

}

configureInterface()
configureInterface(config: CustomType())


func color (_ red: Int? = 1, _ green: Int? = 1, _ blue: Int? = 1) -> (Int, Int, Int) {
    guard let red = red,
        let green = green,
        let blue = blue else {
            return (0, 0, 0)
    }

//    return red + green + blue
    return (red, green, blue)
}
var colorComponent: Int? = nil
let variable = functionName(id: 1, param2: 1.5)
color()


struct CustomStruct {
//    var
//    let
    func shortAction() {

    }
    static func internalFunc() {
//        shortAction()
    }
}

var customStructVar = CustomStruct()
customStructVar.shortAction()
CustomStruct().shortAction()
CustomStruct.internalFunc()

// Parameters

// Default value

// Return value

// inout

func multiplyOnTen(value: inout Int) {
    value *= 10
}

var givenValue = 5
multiplyOnTen(value: &givenValue)
givenValue
import Foundation

func resolveString(text: inout String) {
    let placeholder = "{APP_VERSION}"
    let version = "v0.0.1"
    text = text.replacingOccurrences(of: placeholder, with: version)
}

var givenText = "Jan 23, 2019 - In Swift 2 the use of split becomes a bit more complicated due to the ... componentsSeparatedByString() // And then to access the individual words: {APP_VERSION} Jan 23, 2019 - In Swift 2 the use of split becomes a bit more complicated due to the ... componentsSeparatedByString() // And then to access the individual words: v"
resolveString(text: &givenText)
givenText

//var multiplyResult = multiplyOnTen(value: 5)

//: ## Closures
//: [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
var customClosure: (Int, Double) -> Int = { (intValue, doubleValue) -> Int in
//    print(intValue)
//    print(doubleValue)
    return intValue + Int(doubleValue)
}
//func functionName (id index: Int, param2: Double) -> Int {
//    return index
//}
var customClosureShort: () -> Void = {
//    print("Hello world!")
}
customClosureShort()
let constantClosure = customClosureShort
constantClosure()

var cCShortening: (Int, Double) -> Int = { $0 + Int($1) }


//{ (parameters) -> return type in
//    statements
//}
//typealias MyClosure = (Int, String) -> Void
//var customClosure: (Int, String, Double) -> Void = {
//    print("closure is called")
//    print($0)
//    print($1)
//    print($2)
//}
//var newClosure = customClosure
//newClosure(1, "Hello", 1.0)
//
//var oneMoreClosure: MyClosure = { myInteger, myString in
//
//}

func operation(arg1: Int, arg2: Int, closure: (Int, Int) -> Void) {
    closure(arg1, arg2)
}

//let handler1: (Int, Int) -> Void = {
////    print($0 * $1)
//}

//operation(arg1: 5, arg2: 5, closure: handler1)

operation(arg1: 7, arg2: 7, closure: { (arg1, arg2) in
//    print(arg1 + arg2)
})

//operation(arg1: 12, arg2: 12) {
////    print($0 * $1)
//}

var array = [1, 2, 3]
array.reduce(0) { (result, intValue) -> Int in
    result + intValue
}

// Same implementation:

let handler3: (Int, Int) -> Int = {
    $0 + $1
}
var result1 = 0

for element in array {
    result1 = handler3(result1, element)
}

array.reduce(0, +)

//array.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
//array.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)

//: ### Homework:

//1. Write a Swift program to check if two given arrays of integers have 0 as their first element.
//произвести проверку двух массивов(Int) являются ли их первые элементы нулями и вывести соответствующее сообщение в консоль.
print("Task 1")

var arrayForCheck1: Array<Int> = [0,2,3,4,5]
var arrayForCheck2: Array<Int> = [1,2,3,4,5]

func checkFirstElementIn(array1: Array<Int>, array2: Array<Int>, closure: (Array<Int>, Array<Int>) -> Void){
    closure(array1,array2)
}
print("Замыкание не сокращенное")
checkFirstElementIn(array1: arrayForCheck1, array2: arrayForCheck2) { (arr1, arr2) in
    if arr1.first == 0 {
        print("The first element of the array 1 is zero")
    } else {
        print("The first element of the array 1 is not zero. It`s: \(arr1.first ?? 0)")
    }
    if arr2.first == 0 {
        print("The first element of the array 2 is zero")
    } else {
        print("The first element of the array 2 is not zero. It`s: \(arr2.first ?? 0)")
    }
}
//Можно сократить
print("Сокращенное замыкание")
checkFirstElementIn(array1: arrayForCheck1, array2: arrayForCheck2) {print("The first element of the array 1: \($0.first ?? 0), The first element of the array 2: \($1.first ?? 0)")}
//Можно просто функцией
print("Реализация функцией")
func func2checkFirstElementIn(array1: Array<Int>, array2: Array<Int>){
    if array1.first == 0 {
        print("The first element of the array 1 is zero")
    } else {
        print("The first element of the array 1 is not zero. It`s: \(array1.first ?? 0)")
    }
    if array2.first == 0 {
        print("The first element of the array 2 is zero")
    } else {
        print("The first element of the array 2 is not zero. It`s: \(array2.first ?? 0)")
    }
}
func2checkFirstElementIn(array1: arrayForCheck1, array2: arrayForCheck2)

print("Замыкание в методе")
func func3CheckFirstElementIn(array1: Array<Int>, array2: Array<Int>) {
    if (array1.first(where: { $0 == 0 }) != nil) {
        print("The first element of the array 1 is zero")
    }
    else {
         print("The first element of the array 1 is not zero.")
    }
    if (array2.first(where: {$0 == 0}) != nil) {
        print("The first element of the array 2 is zero")
    }
    else {
        print("The first element of the array 2 is not zero.")
    }
}

func3CheckFirstElementIn(array1: arrayForCheck1, array2: arrayForCheck2)

print("Ну и просто циклом")
func checkFirstElementLoopIn(array1: Array<Int>, array2: Array<Int>) {
    for firstElement in array1 {
        if firstElement == 0 {
            print("The first element of the array 1 is zero")
            break
        }
        else {
            print("The first element of the array 1 is not zero.")
            break
        }
    }
    for firstElement in array2 {
        if firstElement == 0 {
            print("The first element of the array 2 is zero")
            break
        }
        else {
            print("The first element of the array 2 is not zero.")
            break
        }
    }
}

checkFirstElementLoopIn(array1: arrayForCheck1, array2: arrayForCheck2)

print("Ну или совсем просто")

func check(array1: Array<Int>, array2: Array<Int>) {
    if array1[0] == 0 {
        print("The first element of the array 1 is zero")
    }
    else {
        print("The first element of the array 1 is not zero.")
    }
    if array2[0] == 0 {
        print("The first element of the array 2 is zero")
    }
    else {
        print("The first element of the array 2 is not zero.")
    }
}

check(array1: arrayForCheck1, array2: arrayForCheck2)
//2. Write a Swift program to test if an array of integers does not contain a 3 or a 5.
//произвести проверку двух массивов(Int) на отсутствие в них элементов 3 и 5 и вывести соответствующее сообщение в консоль

print("Task 2")

print("Это для тренеровки замыканий")
func containElementIn(array1: Array<Int>, array2: Array<Int>, checkElement1: Int, checkElement2: Int, closure: (Array<Int>, Array<Int>, Int, Int) -> Void) {
    closure(array1,array2,checkElement1,checkElement2)
}

containElementIn(array1: arrayForCheck1, array2: arrayForCheck2, checkElement1: 5, checkElement2: 3) {arr1,arr2,chkEl1,chkEl2 in
    if arr1.contains(chkEl1) || arr1.contains(chkEl2) {
        print("Array 1 contain one of check element")
    }
    else {
        print("Array 1 doesn`t contain one of check element")
    }
    if arr2.contains(chkEl1) || arr2.contains(chkEl2) {
        print("Array 2 contain one of check element")
    }
    else {
        print("Array 2 doesn`t contain one of check element")
    }
}

print("Реализация в функции")
func containElement1In(array1: Array<Int>, array2: Array<Int>,checkElement1: Int, checkElement2: Int) {
    if array1.contains(checkElement1) || array1.contains(checkElement2) {
        print("Array 1 contain one of check element")
    }
    else {
        print("Array 1 doesn`t contain one of check element")
    }
    if array2.contains(checkElement1) || array2.contains(checkElement2) {
        print("Array 2 contain one of check element")
    }
    else {
        print("Array 2 doesn`t contain one of check element")
    }
}
containElement1In(array1: arrayForCheck1, array2: arrayForCheck2, checkElement1: 6, checkElement2: 7)

//3. Write a Swift program to check whether the first element and the last element of a given array of integers are equal.
//произвести проверку одинаковы ли первый и последний элементы данного массива(Int) и вывести соответствующее сообщение в консоль
print("Task 3")

let arrayForCheck: Array<Int> = [1,2,3,4,56,1]

func checkFirstLastElementIn(array: Array<Int>) {
    if array.last == array.first {
        print("Первый и последний элемент заданного массива одинаковы")
    } else {
        print("первый и последний элементы массива не одинаковые")
    }
}
checkFirstLastElementIn(array: arrayForCheck)

print("Реализация без методов")

func checkFirstLastElIn(array: Array<Int>) {
    let firstElement: Int = array[0]
    let lastElement: Int = array[array.count - 1]
    if firstElement == lastElement {
        print("Первый и последний элемент заданного массива одинаковы")
    } else {
        print("первый и последний элементы массива не одинаковые")
    }
}
checkFirstLastElIn(array: arrayForCheck)

print("Ну и с использованием замыкания")

func checkFirstLastElementWithClouserIn(array: Array<Int>, closure: (Int, Int) -> Void) {
    let firstElementInArray = array.first ?? 0
    let lastElementInArray = array.last ?? 0
    closure(firstElementInArray,lastElementInArray)
}

checkFirstLastElementWithClouserIn(array: arrayForCheck) {
    if ($0 == $1) {
        print("Первый и последний элемент заданного массива одинаковы")
    } else {
        print("первый и последний элементы массива не одинаковые")
    }
}

//4. Write a Swift program that creates Array, adds an item, remove item, modify item and then prints size of the array.
//проинициализировать массив, добавить в него элемент, удалить элемент, модифицировать какой-нибудь элемент и вывести в консоль размер массива(количество элементов)

print("Task 4")

var arrayForManipulations: Array<String> = ["Sasha","Masha","Georgi","Rom","Ann","Sergey","Sasha","Nasti","Lesha"]

arrayForManipulations.append("Tom")
arrayForManipulations.insert("Dav", at: 2)
print(arrayForManipulations)

arrayForManipulations.remove(at: 2)
print(arrayForManipulations)

arrayForManipulations[3] = "Romax"
print(arrayForManipulations)

print(arrayForManipulations.count)
var count = 0
for _ in arrayForManipulations {
    count += 1
}
print(count)
//5. Write a Swift program that creates Dictionary, adds an item, remove item, modify item and then prints size of the Dictionary.
//проинициализировать словарь, добавить в него элемент, удалить элемент, модифицировать какой-нибудь элемент и вывести в консоль размер словаря(количество элементов)
print("Task 5")

var dictionaryForManipulations: Dictionary<String,Int> = ["Sasha": 1, "Masha": 2, "Rom": 3]

dictionaryForManipulations["Sergey"] = 4
dictionaryForManipulations["Romax"] = 5
print(dictionaryForManipulations)

dictionaryForManipulations["Masha"] = nil
dictionaryForManipulations.removeValue(forKey: "Rom")
print(dictionaryForManipulations)

dictionaryForManipulations["Sasha"] = 10
dictionaryForManipulations.updateValue(9, forKey: "Romax")
print(dictionaryForManipulations)

print(dictionaryForManipulations.count)
var countForDictionary = 0
for (_, _) in dictionaryForManipulations {
    countForDictionary += 1
}
print(countForDictionary)


//6. Write a Swift program that creates Set, adds an item and then prints size of the Set.
////проинициализировать Сет, добавить в него элемент и вывести в консоль размер Сета(количество элементов)
print("Task 6")
var setForManipulations: Set<Int> = [1,2,3,4,5]

setForManipulations.insert(6)
setForManipulations.insert(7)
setForManipulations.insert(7)
setForManipulations.insert(8)

print(setForManipulations)

setForManipulations.remove(2)
print(setForManipulations)

print(setForManipulations.count)

//7. Create 2 arrays, and merge them.
//проинициализировать 2 массива и объединить(можно в новом массиве)

print("Task 7")
var array1: Array<Int> = []
for _ in 0 ..< 6 {
    array1.append(Int.random(in: 0...10))
}
var array2: Array<Int> = []
for _ in 0 ..< 6 {
    array2.append(Int.random(in: 0...10))
}

func unionOfTwoArrays(array1: Array<Int>, array2: Array<Int>) -> Array<Int> {
    var resultArray: Array<Int> = []
    resultArray = array1 + array2
    return resultArray
}
print(array1)
print(array2)
print(unionOfTwoArrays(array1: array1, array2: array2))

//8. Write a closure to sum 2 integers, pass closure as argument to function, where return the result of calling that closure.
//Написать замыкание(closure), задача которого складывать 2 полученных аргумента типа Int и вернуть его и вывести в консоль.
print("Task 8")

func printingFunc(closure: @escaping (Int,Int) -> Int) -> (Int, Int) -> Void {
    let exec: (_ intger1: Int, _ integer2: Int) -> Void = {
        print("Result is: \(closure($0,$1))")
    }
    return exec
}

let sum: (Int,Int) -> Int = {$0 + $1}
let multiply: (Int,Int) -> Int = {$0 * $1}
let devide: (Int,Int) -> Int = {$0 / $1}
let minus: (Int,Int) -> Int = {$0 - $1}

let arrayOfMathFunc: Array<(Int,Int) -> Int> = [sum, multiply, devide, minus]

var printing = arrayOfMathFunc.map({printingFunc(closure: $0)})

printing[0](10,5)
printing[1](3,3)


//9. Подготовить примеры:
// array.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
// array.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)


