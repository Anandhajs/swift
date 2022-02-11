import UIKit

/*
        program for generics
 *      1. Generic Function
 *      2. Generic Class
 *      3. generic Type Constraints
 */
 
            // 1. Generic Function
/*
        func display<T>(data: T){
            print("geberic function")
            print("data passed",data)
        }
        display(data: "anand")
        display(data: 25)

*/
            // 2. Generic Class


        class display<T>{
            var data: T
            init(data: T){
                self.data = data
            }
            func get() -> T {
                return data
            }
        }
        var a = display<Int>(data: 72)
        print("generic class return",a.get())
        var b = display<String>(data: "kumar")
        print("generic class return",b.get())

 



            // 3. Type Constraints generics
/*

        func add<T : Numeric>( a: T, b: T ){
            print("The addition is: \(a + b)")
        }

        add(a: 10, b: 20)
        add(a: 40.5, b: 20.4)
        //add(a: "anand", b: "swift")

 */
