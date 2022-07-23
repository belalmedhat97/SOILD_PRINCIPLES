import Foundation


// The idea of open/closed Principle:
// ###########################################
/// "Entities should be open for extension, but closed for modification.
/// Entities as classes, structs or methods should be simple to change.
/// Closed for modification, we want to change that entity's behavior without modifying its source code.



////MARK: - Bad Practice Example
//// here the class define the square and handle data inside it like width, height
//class Square {
//    var width:Double
//    var height:Double
//    init(width:Double,height:Double){
//        self.width = width
//        self.height = height
//    }
//}
//// here the class define the circle and handle data inside it like radius
//class Circle {
//
//  var radius: Double
//
//  init(radius: Double) {
//      self.radius = radius
//  }
//
//}
//// here the class define the area calculator and calculate the area of square only
///// if we need to add another shape to be calculated we have to change in the func calculateArea and that against open/closed principle
//class areaCalculator {
//
//    func calculateArea(square:Square)->Double{
//
//       return square.height * square.width
//    }
//}
//// if you want to calculate the area of circle too you have to change in the areaCalculator func code
//// note :: change in classname so that the xcode don't show error in redundant naming for class with areaCalculcator
//class areaCalculator2 {
//
//    func calculateArea(shape:AnyObject)->Double{
//        if shape is Square {
//            let shapeSquare = shape as! Square
//            return shapeSquare.height * shapeSquare.width
//        }else{
//            let shapeCircle = shape as! Circle
//            return pow(shapeCircle.radius, 2) * Double.pi
//        }
//    }
//}
//
//
////MARK: - Good Practice Example
/////  separate the behavior of calculating area behind protocol and then flip the dependencies around
/////
//// add protocol of shape that has a area varaible
//protocol Shape {
//  var area: Double { get }
//}
//// here the class define the square and handle data inside it like width, height
//class SquareA:Shape {
//
//    var width:Double
//    var height:Double
//    var area: Double {
//        return width * height
//    }
//    init(width:Double,height:Double){
//        self.width = width
//        self.height = height
//    }
//}
//// here the class define the circle and handle data inside it like radius
//class CircleA:Shape {
//
//  var radius: Double
//  var area: Double {
//      return pow(radius, 2) * Double.pi
//  }
//
//
//  init(radius: Double) {
//      self.radius = radius
//  }
//
//}
//
//class areaCalculatorWithOCPrinciple {
//
//    func calculateArea(typeShape:Shape)->Double{
//        return typeShape.area
//    }
//}
////without open/closed prinicple
//let sq = Square(width: 20, height: 20)
//let ci = Circle(radius: 30)
//let aC = areaCalculator2()
//
////with open/closed prinicple
//let sqA = SquareA(width: 20, height: 20)
//let ciA = CircleA(radius: 30)
//let aOC = areaCalculatorWithOCPrinciple()
//
//aC.calculateArea(shape: sq)
//aC.calculateArea(shape: ci)
//aOC.calculateArea(typeShape:sqA)
//func MathChallenge(_ str: String) -> String {
//
//    if str.count != 0 || str.count == 1{
//    let arrCharacters = Array(str)
//    var longSub:String = "\(str.first ?? " ")"
//        if str.count % 2 == 0 {
//            var firstHalf = ""
//            var secondHalf = ""
//            let middleIndex = (arrCharacters.count - 1) / 2
//            print("middleIndex:\(middleIndex)")
//            for fHalfCount in 0...middleIndex {
//                firstHalf += "\(arrCharacters[fHalfCount])"
//            }
//            for sHalfCount in middleIndex+1...arrCharacters.count - 1 {
//                secondHalf += "\(arrCharacters[sHalfCount])"
//
//            }
//            print(firstHalf)
//            print(secondHalf)
//            if firstHalf == secondHalf {
//             return "\(firstHalf)"
//            }
//        }
//    for counter in 0...arrCharacters.count - 1 {
//        if arrCharacters.count - 1 != counter {
//
//            longSub += "\(arrCharacters[counter+1])"
//            print("longSub :\(longSub)")
//            var inputStr = ""
//        let arrayDividien = (arrCharacters.count - 1) / longSub.count
//            print("arrayDividien :\(arrayDividien)")
//
//            if arrayDividien % 2 == 0 {
//              print("arrayDividien :\(arrayDividien)")
//
//            for _ in 0...arrayDividien {
//              inputStr += longSub
//                if inputStr.count > str.count {
//                    return "-1"
//                }
//                print("inputstring:\(inputStr)")
//                if inputStr == str {
//                    print("value :\(inputStr)")
//                return longSub
//              }
//            }
//          }else{
//              print("arrayDividien :\(arrayDividien)")
//
//            for _ in 0...arrayDividien {
//              inputStr += longSub
//                if inputStr.count > str.count && (longSub.count - 1) == str.count - 2 {
//                    return "-1"
//                }
//                print("inputstring:\(inputStr)")
//
//                if inputStr == str {
//                    print("value :\(inputStr)")
//                return longSub
//              }
//            }
//          }
//        }
//
//    }
//  // code goes here
//  // Note: feel free to modify the return type of this function
//  return "-1"
//    }else{
//        return "\(-1)"
//    }
//}
//
////MathChallenge("ababababab")
//print(MathChallenge("abcabc"))

/// Approach: Stack

func ArrayChallenge(_ arr: [Int]) -> Int {

  // code goes here
  // Note: feel free to modify the return type of this function

  if arr.count != 1 {

      var height = arr
      height.append(-1)
      var stack = [-1]
      var largestArea = 0

      for counter in 0...height.count - 1 {

        while let endValue = stack.last , endValue >= 0 && height[endValue] > height[counter]{
          stack.removeLast()
          if let leftValue = stack.last {
            let currentArea = (counter - leftValue - 1) * height[endValue]
            largestArea = max(currentArea,largestArea)
          }
        }
        stack.append(counter)
      }
      return largestArea

  }else{
      return 1 * (arr[0])
  }
//  return arr[0]
}
//func ArrayChallenge(_ arr: [Int]) -> Int {
//
//  // code goes here
//  // Note: feel free to modify the return type of this function
//
//  if arr.count != 1 && arr.count != 0 {
//
//
//  var intialHeight = 0
//  var widthCounter = 0
//  var area = 0
//
//  for counter in 1...arr.count - 1 {
//      print("counbtereeee \(counter)")
////      print("arr:Counter \(arr[counter])")
//
//      if arr[counter] <= arr[counter-1] && counter != arr.count - 1{
//            intialHeight = counter
//          print("intial \(intialHeight)")
//          print("arr:Counter \(arr[counter])")
//          widthCounter += 1
//              for innerCount in counter+1...arr.count - 1 {
//                  print("widthcounter \(widthCounter)")
//                  print("intial \(intialHeight)")
//
//                  print("arr:iunner \(arr[innerCount])")
//                  if innerCount == arr.count - 1 {
//                      print("end array \(arr.count - 1)")
//                      widthCounter += 1
//                      print("case end array ")
//                      print("area \(area)")
//
//                      if area <= widthCounter * arr[intialHeight] && area != 0 {
//                          print("area \(area)")
//                          return widthCounter * arr[intialHeight]
//                      }else{
//
//                          area = widthCounter * arr[intialHeight]
//                          print("widthcounter area \(widthCounter)")
//                          widthCounter = 0
////                          intialHeight = arr[intialHeight+1]
//                          print("area j \(area)")
//        //                  let area+ = widthCounter * arr[intialHeight+1]
//    //                      return area
//                      }
//
//                  }else if arr[intialHeight] == arr[innerCount] {
//    //                  widthCounter += 1
//                      print("case == ")
//                      print("arrintail:\(arr[intialHeight]) \(arr[innerCount])")
//
//                      if area <= widthCounter * arr[intialHeight] && area != 0 {
//                          return widthCounter * arr[intialHeight]
//                      }else{
//                          area = widthCounter * arr[intialHeight]
//                          intialHeight = arr[intialHeight+1]
//
//        //                  let area+ = widthCounter * arr[intialHeight+1]
//    //                      return area
//                      }
//
//                  }else if arr[intialHeight] > arr[innerCount] {
//                      print("case intial is bigger ")
//
//    //                  widthCounter -= 1
//                      if area <= widthCounter * arr[intialHeight] &&  area != 0{
//                          return widthCounter * arr[intialHeight]
//                      }else{
//                          area = widthCounter * arr[intialHeight]
////                          intialHeight = arr[intialHeight+1]
//
//        //                  let area+ = widthCounter * arr[intialHeight+1]
//    //                      return area
//                      }
//    //                  area = widthCounter * arr[intialHeight]
//    //
//    //                  return area
//                  }else{
//                      widthCounter += 1
//    print("dkawld;aldk;dk;lwa")
//    //                  widthCounter -= 1
//    //                  intialHeight = innerCount
//                  }
//
//              }
//
//
//      }else{
//          if counter != arr.count - 1 {
//              print("second data ##############")
//              intialHeight = counter
//            print("intial \(intialHeight)")
//            print("arr:Counter \(arr[counter])")
//            widthCounter += 1
//                for innerCount in counter+1...arr.count - 1 {
//                    print("widthcounter \(widthCounter)")
//                    print("intial \(intialHeight)")
//
//                    print("arr:iunner \(arr[innerCount])")
//                    if innerCount == arr.count - 1 {
//                        print("end array \(arr.count - 1)")
//                        widthCounter += 1
//                        print("case end array ")
//                        print("area \(area)")
//
//                        if area <= widthCounter * arr[intialHeight] && area != 0 {
//                            print("area \(area)")
//                            return widthCounter * arr[intialHeight]
//                        }else{
//
//                            area = widthCounter * arr[intialHeight]
//                            print("widthcounter area \(widthCounter)")
//  //                          intialHeight = arr[intialHeight+1]
//                            print("area j \(area)")
//                            widthCounter = 0
//          //                  let area+ = widthCounter * arr[intialHeight+1]
//      //                      return area
//                        }
//
//                    }else if arr[intialHeight] == arr[innerCount] {
//      //                  widthCounter += 1
//                        print("case == ")
//                        print("arrintail:\(arr[intialHeight]) \(arr[innerCount])")
//
//                        if area <= widthCounter * arr[intialHeight] && area != 0 {
//                            return widthCounter * arr[intialHeight]
//                        }else{
//                            area = widthCounter * arr[intialHeight]
//                            intialHeight = arr[intialHeight+1]
//                            widthCounter = 0
//
//          //                  let area+ = widthCounter * arr[intialHeight+1]
//      //                      return area
//                        }
//
//                    }else if arr[intialHeight] > arr[innerCount] {
//                        print("case intial is bigger ")
//
//      //                  widthCounter -= 1
//                        if area <= widthCounter * arr[intialHeight] &&  area != 0{
//                            return widthCounter * arr[intialHeight]
//                        }else{
//                            area = widthCounter * arr[intialHeight]
//                            widthCounter = 0
//  //                          intialHeight = arr[intialHeight+1]
//
//          //                  let area+ = widthCounter * arr[intialHeight+1]
//      //                      return area
//                        }
//      //                  area = widthCounter * arr[intialHeight]
//      //
//      //                  return area
//                    }else{
//                        widthCounter += 1
//      print("dkawld;aldk;dk;lwa")
//      //                  widthCounter -= 1
//      //                  intialHeight = innerCount
//                    }
//
//                }
//          }
//
//      }
//  }
//
//  }else{
//      return 1 * (arr[0])
//  }
//  return arr[0]
//
//}

// keep this function call here
print(ArrayChallenge([6, 3, 1, 4, 12, 4]))
