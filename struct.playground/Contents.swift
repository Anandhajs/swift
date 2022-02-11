import UIKit


/*
        Function inside the struct
 */


struct vechile{
    var car = ""
    var gear = 5
    func demo(){
    print("The vechile type function")
        
    }
}
var transport = vechile()
transport.car = "honda"
print("the vechile name is \(transport.car).contain \(transport.gear) gears")
transport.gear = 6
print("No. of gears: \(transport.gear)")
print("the vechile name is \(transport.car).the updated gear is \(transport.gear) gears")
