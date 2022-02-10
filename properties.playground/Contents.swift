import UIKit
/*      Example program for properties
    *      1. Stored and Computed properties
    *      2. getter and setter properties
 
 */

/*   class add{
    
    // a and b are stored properties
 
    var a: Int = 0
    var b: Int = 0
    
    // sum is a computed properties
 
    var sum: Int {
        a + b
    }
 
    }
    var value = add()
    value.a = 10
    value.b = 20
    print("The sum is : \(value.sum)")
 
*/

// properties using getter and setter method

class add{
    

    var a: Int = 0
    var b: Int = 0
    
    var sum: Int {
        set(alert){
            a = (alert + 40)
            b = (alert + 20)
        }
        get{
        a + b
    }
       
}
}
var value = add()
value.a = 10
value.b = 20
print("The sum is : \(value.sum)")
value.sum = 10
print("the value of a: \(value.a)")
print("the value of b: \(value.b)")


