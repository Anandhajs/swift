import UIKit

// Using Closure

    // This is the Function with Return Type
        /*
         *   func add( num1: Int, num2: Int ) -> Int
         *   {
         *       let sum = num1 + num2
         *       return sum
         *   }
         */

    // This is the Closure Declaration
        /*
         *      { num5, num6 -> Int in
         *        return num5 + num6
         *      }
         */

    // closures are Asigning the Parameter (or) variable(add)
        /*
         *   let add: ( Int, Int ) -> Int = { num5, num6 -> Int in
         *       return num5 + num6
         *   }
         */

    //  let add: ( Int, Int ) -> Int = add(num1:num2:)  ---> Asigining the Function to variable(add)



                func result( num3: Int, num4: Int , addition: (( Int,Int ) -> Int )) {
                    print("number1: \(num3) number2 : \(num4)")
                    print()
                        let value = addition(num3 , num4)
                    print("The Addition of Two Number is : \(value)")
                }
                   
    //  result(num3: 20, num4: 20, addition: add)


    // Passing the closure to  function (ie..result)
    //** Function accept the Closure as it's Last Parameter is known as Trailing closure

            result(num3: 10, num4: 20 )  {num, num1 -> Int in
                return num + num1
            }
