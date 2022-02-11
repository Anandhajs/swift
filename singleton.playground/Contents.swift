import UIKit

 /*
        Swift singleton
 */

/*
        class car{
            static let carObject = car()  // static object creation
            
            private init(){
                                //   private initializer
            }
            func drive(name: String){
                if name == ("Anand"){
                    print("The permission granted. open door")
                }else{
                    print("access denied. door not open")
                }
            }
        }
        let dname = "anand"
        var honda = car.carObject
        honda.drive(name: dname)
*/


        // Error Handling

        enum divisionError: Error{
            case dividedByZero
        }
        func division(a: Int, b: Int) throws {
            if b == 0 {
                throw divisionError.dividedByZero
            }else{
                let result = a / b
                print(result)
            }
        }
        do{
            try division(a: 10, b: 5)
            print("the valid division")
                
            }
        catch divisionError.dividedByZero {
            print("error : the denaminator can not be 0")
        }

