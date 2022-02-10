import UIKit

protocol Mathamatics {
    func add(a: Int, b: Int)
    func sub(c: Int, d: Int)
    func mul(e: Int, f: Int)
    
}
class addition: Mathamatics {
    func add(a: Int, b: Int) {
        let sum = a + b
        print("the sum is : \(sum)")
    }
    
    func sub(c: Int, d: Int) {
        let sum1 = c - d
        print("the subtraction is : \(sum1)")
    }
    
    func mul(e: Int, f: Int) {
     let sum2 = e * f
        print("the multiplication is : \(sum2)")
        
    }
    
   // func add(a: Int, b: Int) {
        //let sum = a + b
        //print("The addition is : \(sum)")
    }
let value = addition()
value.add(a: 10, b: 20)
value.sub(c: 20, d: 40)
value.mul(e: 15, f: 20)
