import UIKit

// random number example
/*
    var num =  [2,4,1,6,8,3]
//  let nums = num.randomElement()
    print(num.randomElement()!)
*/


// if let example
/*
    func checkAge() {
        
        var age: Int? = 20

        if let myAge = age  {
          
          return
        

        print("My age is \(myAge)")
        }else{
            print("Age is undefined")
        }
    }
      checkAge()
*/


// gaurd  example
    func voteEligibility() {
    
    let age: Int? = 20

        guard ((age)! >= 18) != nil else {
    ("Not Eligible to vote")
        return
    }

        print("Eligible to vote")
    }

    voteEligibility()
    

