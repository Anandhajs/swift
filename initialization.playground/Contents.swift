import UIKit
//  initialization

/*
    struct cube{
        var length: Double
        var breadth: Double
        var area: Double
        init(froml length: Double,fromb breadth: Double) {
            self.length = length
            self.breadth = breadth
            area = length * breadth
        }
        init(le l: Double, br b: Double) {
            self.length = l
            self.breadth = b
            area = l * b
        }
    }
    var volume = cube(froml: 15.0, fromb: 10.0)
    print("the area of cube is :\(volume.area)")
    var vol = cube(le: 21.0, br: 14.0)
    print("the area of cube is :\(vol.area)")
*/


// Deinitialization

/*
    var count = 0
    class base{
        init(){
            count += 1
        }
        deinit{
            count -= 1
        }
    }
    var var1: base? = base()
    print(count)
    //var1 = nil
    print(count)
*/


// Typecasting


class subject{
    var physics: String
    init(physics: String) {
        self.physics = physics
    }
}
class chemistry: subject{
    var equation: String
    init(physics: String, equation: String) {
        self.equation = equation
        super.init(physics: physics)
    }
}
class math: subject{
    var farmula: String
    init(physics: String, farmula: String) {
        self.farmula = farmula
        super.init(physics: physics)
    }
}
let sa = [ chemistry(physics: "addition", equation: "plus"), math(physics: "division", farmula: "divide")]
let sample = chemistry(physics: "addition", equation: "plus")
print("the instance is : \(sample.physics)")
print("the instance is : \(sample.equation)")
let sample1 = math(physics: "division", farmula: "divide")
print("the instance is : \(sample1.physics)")
print("the instance is : \(sample1.farmula)")
