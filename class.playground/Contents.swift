import UIKit
func findFactorial(of num: Int) -> Int {
    if num == 1 {
        return 1
    } else {
        return num * findFactorial(of:num - 1)
    }
}
  
let x = 6
let result = findFactorial(of: x)
print("The factorial of \(x) is \(result)")

