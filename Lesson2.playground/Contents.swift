
/*:
# iOS Development
by **Vadim Zhuk**
## Lecture 2 - TYPES
 * Typization - what is it?
 * Basic types
 * Basic operators
*/

/*:
# Constants and Variables
* let - constant
* var - variable
*/


/*:
 ## INTEGERS
*/
// https://developer.apple.com/documentation/swift/int
let constInteger: Int = 10 // Int type
constInteger
//constInteger = 1 // Cannot assign to value: 'constInteger' is a 'let' constant

let intMax = Int.max // max value of Int
let intMin = Int.min // min value of Int

let constMaxUInt: UInt = UInt.max // UInt - Unsigned Integer - only positive values
constMaxUInt
// UInt has same range as Int, but only positive

let newConstInteger = constInteger // Initialize new constant with value of constInteger

var varInteger: Int = constInteger // Initialize new variable with value of constInteger

/*:
 ## Floating-Point Numbers:
 ### FLOAT
 ### DOUBLE
*/

var double1: Double = 55 // new variable of type Double with value 55.0
var casted = Double(varInteger) // type-casting from Int to Double

0.000000 //float
0.000000000000000 //double

/*:
 # Type BOOLEAN
 */

// https://developer.apple.com/documentation/swift/bool

var boolean: Bool = true // just true or false
var oppositeBoolean = !boolean
var result = varInteger > varInteger1 // Boolean

/*:
# Types STRING, CHAR
*/

// https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
// https://developer.apple.com/documentation/swift/string
var string: String = "iOS Development🧑‍💻" //
var string2 = "M"
var stringID = "ID1"
var stringCode = "14"
var stringYear = "20"
print(string+"\n"+string2+"-"+stringID+"-"+stringCode+"-"+stringYear) // Concatenation string

/*:
 # BASIC OPERATORS
 */
// https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html

// = - assignment operator
varInteger = 55 // set new value to varInteger

// Arithmetic operators:
// Addition (+)
// Subtraction (-)
// Multiplication (*)
// Division (/)
// Remainder (%)

varInteger + 1 // operator + doesn't set the value - use operator with assignment
var varInteger1 = varInteger + 1
var multiply = varInteger1 * varInteger
var division = varInteger / 12
var rest = varInteger % 12

//Arithmetic with Assignment:
// +=
varInteger += 200 // varInteger = varInteger + 200
// -=
varInteger -= 200
// *=
varInteger *= 2
// /=
varInteger /= 2
// %=
varInteger %= 15

//Comparison:
//Equal to (a == b)
//Not equal to (a != b)
//Greater than (a > b)
//Less than (a < b)
//Greater than or equal to (a >= b)
//Less than or equal to (a <= b)

varInteger == varInteger1 //the result is always true or false - that is boolean type
varInteger != varInteger1
varInteger >= varInteger1
// >
// <
// <=
// >=

/*:
 # ЗАДАНИЕ:
*/
import UIKit
// В своем файле Playground:
// 1. Проинициализируйте константу типа Int с каким-либо значением

let constant1: Int = 5
let constant2: Int
constant2 = 10
let constant3 = 15

// 2. Проинициализируйте переменную типа Int с каким-либо значением

var variable1: Int = 4
var variable2: Int
variable2 = 8
var variable3 = 12
// 3. Проинициализируйте переменную типа Int со значением, равным сумме ранее созданной константе и переменной
var sumConstant1Variable1 = constant1 + variable1
var sumConstant2Variable2: Int
sumConstant2Variable2 = constant2 + variable2

// 4. Задайте новое значение переменной, созданной в п.3, равное произведению константы из п.1 и переменной из п.2

sumConstant1Variable1 = constant1 * variable1

// 5. Проинициализируйте переменую типа Double с каким-либо значением
var variableDouble1: Double = 12
var variableDouble2: Double = 10.0
var variableDouble3 = 11.0
var variableForDouble: Int = 5
var variableDouble4: Double = Double(variableForDouble)

// 6. Проинициализируйте переменную типа Bool с рузьтатом сравнения константы из п.1 и переменной из п.2
var bolean1: Bool = true
constant1 < variable2
constant1 < variable1
// 7. Проинициализируйте переменую типа String с каким-либо значением
var stringVariable1: String = "Hi, I`m Alex."
var stringVariable2: String
stringVariable2 = "I work in Belgosstrakh."
var stringVariable3: String
stringVariable3 = stringVariable1 + " " + stringVariable2
var stringVariable4: String
stringVariable4 = "Hi, I`m Misha, and \(stringVariable2)"

//7. Получение модуля числа
var negativeNumber: Int = -10
var absolutNumber: Int = abs(negativeNumber)
var negativeNumberDouble: Double = -10.10
var absolutNumberDouble: Double = abs(negativeNumberDouble)

//8. Округление чисел
var number: Double
number = Double.pi
var roundedNumber2 = Double(round(100*number) / 100)
var roundedNumber3 = Double(round(100*number) / 1000)

