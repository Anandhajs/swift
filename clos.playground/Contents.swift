import UIKit

/*  var name = [ " Mom", "Dad", "Wife", "Friend" ]
    var words = [ "I Miss You", "I Hate You", "I Sing You" ]
    for Name in name{
    print("\n\n" + Name)
    print()
    for Words in words{
        print("\(Words)")
    }


    print()
    } */

/*
func number(value: Int) -> Int{
    var num = 0
    var array: [Int] = []
    var nNumber = value
    while nNumber > 10
    {
        num = nNumber % 10
        array.append(num)
        nNumber /= 10
    }
    array.append(nNumber)
    let rev = reverse(aNumber: array)
    let sum = add(rev: rev)
    return sum
}
func reverse(aNumber: [Int]) -> [Int]
{
    return aNumber.reversed()
}
func add(rev: [Int]) -> Int
{
    var sum = 0
    for i in 1..<rev.count
    {
        sum += rev[i]
    }
    return sum
}
var all = number(value: 546312)
print(all)


let number: Int? = Optional.some(123)
let noNumber: Int? = Optional.none
print(number)
*/




class Exam {
   var student: toppers?
    //init(student : String) {
       // <#statements#>
   // }
}
class toppers {
   var name = "Intelligent"
}
let stud = Exam()
if let studname = stud.student?.name {
   print("Student name is \(studname)")
} else {
   print("Student name cannot be retrieved")
}
