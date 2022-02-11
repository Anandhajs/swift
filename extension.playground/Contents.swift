import UIKit


class add{
    var a = 0
    var b = 0
    func addition(a: Int, b: Int){
        self.a = a
        self.b = b
        print("The addition is: \(a + b)")
    }
}
extension add{
    func mul()
    {
        var mul = a * b
        print("The multiplication ",mul)
    }
}
var sum = add()
sum.addition(a: 18, b: 6)
sum.mul()
