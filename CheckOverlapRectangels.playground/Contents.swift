import UIKit

class Point {
    var pointX: Int
    var pointY: Int
    init(pointX: Int, pointY: Int) {
        self.pointX = pointX
        self.pointY = pointY
    }
}

class Rectangle {
    var point1: Point
    var point2: Point
    var point3: Point
    var point4: Point
    init(point1X: Int, point1Y: Int,
         point2X: Int, point2Y: Int,
         point3X: Int, point3Y: Int,
         point4X: Int, point4Y: Int) {
        self.point1 = Point.init(pointX: point1X, pointY: point1Y)
        self.point2 = Point.init(pointX: point2X, pointY: point2Y)
        self.point3 = Point.init(pointX: point3X, pointY: point3Y)
        self.point4 = Point.init(pointX: point4X, pointY: point4Y)
    }
}

let myRectangle1 = Rectangle(point1X: 1, point1Y: 1, point2X: 1, point2Y: 3, point3X: 5, point3Y: 2, point4X: 5, point4Y: 4)
let myRectangle2 = Rectangle(point1X: 2, point1Y: 2, point2X: 4, point2Y: 2, point3X: 5, point3Y: 2, point4X: 5, point4Y: 4)

//Описал не все условия пересечения, тк на работе работы много)
func checkOverlapRectangles(rectangle1: Rectangle, rectangle2: Rectangle) {
    if (rectangle1.point4.pointX > rectangle2.point1.pointX && rectangle1.point4.pointY > rectangle2.point1.pointY) ||
        (rectangle1.point1.pointX > rectangle2.point4.pointX && rectangle1.point1.pointY > rectangle2.point4.pointY) {
        print("Прямоугольники пересекаются")
    } else {
        print("Прямоугольники не пересекаются")
    }
}

checkOverlapRectangles(rectangle1: myRectangle1, rectangle2: myRectangle2)
