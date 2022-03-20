import Foundation


// The idea of open/closed Principle:
// ###########################################
/// "Entities should be open for extension, but closed for modification.
/// Entities as classes, structs or methods should be simple to change.
/// Closed for modification, we want to change that entity's behavior without modifying its source code.



//MARK: - Bad Practice Example
// here the class define the square and handle data inside it like width, height
class Square {
    var width:Double
    var height:Double
    init(width:Double,height:Double){
        self.width = width
        self.height = height
    }
}
// here the class define the circle and handle data inside it like radius
class Circle {

  var radius: Double

  init(radius: Double) {
      self.radius = radius
  }

}
// here the class define the area calculator and calculate the area of square only
/// if we need to add another shape to be calculated we have to change in the func calculateArea and that against open/closed principle
class areaCalculator {

    func calculateArea(square:Square)->Double{
        
       return square.height * square.width
    }
}
// if you want to calculate the area of circle too you have to change in the areaCalculator func code
// note :: change in classname so that the xcode don't show error in redundant naming for class with areaCalculcator
class areaCalculator2 {

    func calculateArea(shape:AnyObject)->Double{
        if shape is Square {
            let shapeSquare = shape as! Square
            return shapeSquare.height * shapeSquare.width
        }else{
            let shapeCircle = shape as! Circle
            return pow(shapeCircle.radius, 2) * Double.pi
        }
    }
}


//MARK: - Good Practice Example
///  separate the behavior of calculating area behind protocol and then flip the dependencies around
///
// add protocol of shape that has a area varaible
protocol Shape {
  var area: Double { get }
}
// here the class define the square and handle data inside it like width, height
class SquareA:Shape {
    
    var width:Double
    var height:Double
    var area: Double {
        return width * height
    }
    init(width:Double,height:Double){
        self.width = width
        self.height = height
    }
}
// here the class define the circle and handle data inside it like radius
class CircleA:Shape {
   
  var radius: Double
  var area: Double {
      return pow(radius, 2) * Double.pi
  }
    

  init(radius: Double) {
      self.radius = radius
  }

}

class areaCalculatorWithOCPrinciple {

    func calculateArea(typeShape:Shape)->Double{
        return typeShape.area
    }
}
//without open/closed prinicple
let sq = Square(width: 20, height: 20)
let ci = Circle(radius: 30)
let aC = areaCalculator2()

//with open/closed prinicple
let sqA = SquareA(width: 20, height: 20)
let ciA = CircleA(radius: 30)
let aOC = areaCalculatorWithOCPrinciple()

aC.calculateArea(shape: sq)
aC.calculateArea(shape: ci)
aOC.calculateArea(typeShape:sqA)
