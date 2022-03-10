
/*
        Higher Order Functions in Swift
        1. forEach
        2. map
        3. compactMap
        4. flatMap
        5. filter
        6. split
        7. reduce
        8. sort
 
*/




import UIKit


        // 1. forEach

      //  forEach() in normal format
 
    /*
        var numbers: [Int] = [50,20,10,47,25]
        numbers.forEach{(numbers) in
            print(numbers, terminator: " . ")
        
        }
        //  forEach() in shorthand format
        // numbers.forEach{print($0, terminator: "  ")}
    */

    /*         //  2. map



        var numbers1: [Int] = [50,20,10,47,25]

        let newNumbers = numbers1.map{$0 * 2}
        print(newNumbers)

        var names: [String] = ["anand", "kumar", "java"]
        let newNames = names.map{ $0.uppercased()}
        print("After the map function: ",newNames)
    */


  /*        // 3. compactMap


        var values: [String] = ["2","5","Three","9","6"]

        let compact: [Int] = values.compactMap { str in Int(str) }
        print("After the compactmap function: ",compact)
*/
    

 
    /*        // 4 . flatMap

 

        var names1: [[String]] = [["anand", "kumar"],["java","web"],["front","back"]]
        var newNames = names1.flatMap{$0}
        print("After the flatmap function: ",newNames)
        print()
    */

    /*         // 5. Filter


        var names2: [String] = ["anand", "kumar", "java"]
        print("The Filter function")
      
        var newArray = names2.filter{ $0.contains("a") && $0.count > 4}

        print("After the filter function: ",newArray)
        print()
    */

   
    /*
                // 6. split
            

        let arrayValues: [Int] = [1,2,3,4,5,6,7,8,9,20]
        let newArrayValues = arrayValues.split(separator: 5)
        print(newArrayValues)
    */

 
    /*
            // 7. Reduce

        let arrayValues1: [Int] = [1,2,3,4,5,6,7,8,9,20]
         print("The reduce function")
        let sum = arrayValues1.reduce(0, {$0 + $1})
        print("the sum is: ",sum)
        print()
    */

            // 8. Sort

    
        let words: [Int] = [10,2,54,45,0,12,4,5]
        //let newWords = words.sorted()
        let newWords = words.sorted(by: > )
        print(newWords)
        print()
    
 
 
