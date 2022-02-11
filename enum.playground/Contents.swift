import UIKit

/*
 *   using enum in swift
 */


 /*
    enum subject{
    case tamil, english, maths
    }

    var a: subject
    a = subject.tamil
    print("The subject is : ",a)
 */

 
    // Iterate enum case using for-in loop
 
 /*
    enum subject: CaseIterable{
        case tamil, english, maths
    }
        for a in subject.allCases{
        print(a)
        }
*/
 


        // enum using switch case

/*
     enum subject{
        case tamil, english, math
    }
    var a = subject.tamil
     
    switch a {
    case .english:
        print("The subject is:",a)
    case .math:
        print("The subject is:", a)
    case .tamil:
        print("The subject is:",a)
    default:
        print("default switch case")
    }

*/

        // enum with named associated values

        enum subjectMarks{
            case tamil(mark:Int)
            case english(mark:Int)
            case math(mark: Int)
        }
        var a = subjectMarks.tamil(mark: 68)

        switch a {
        case let .english(mark):
           print("The subject english mark is:",mark)
        case let .math(mark):
           print("The subject math mark is:", mark)
        case let .tamil(mark):
           print("The subject tamil mark is :",mark)
       // default:
          // print("default switch case")
        }

