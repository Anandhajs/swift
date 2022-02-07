import UIKit

//functionOverloading

struct anand{
    
}
struct vicky{
    
}
struct kumar{
    
}

func running(with run: anand){
    print("anand running")
}
func running(with run: vicky){
    print("vicky running")
}
func running(with run: kumar){
    print("kumar running")
}
running(with: anand())
running(with: vicky())
running(with: kumar())



//dictionary

let dic = [ " anand" , "kumar" , "raman" ]
let dic1 = [ " cbe" , "nellai" , "tuti" ]
var dic3 = Dictionary( uniqueKeysWithValues: zip(dic,dic1) )
print(dic3)
let a: [ Int : Int ] = [:]
print(a)


// sets

var name: Set = [ "anand" , "kumar" , "ram" ]
print(name)
if let name1 = name.remove("kumar"){
print(name1)
}else{
    print("incorrect")
}
name.insert("anand1")
print(name)


let ac: Set = [ 4, 5, 6, 7 , 11 ]
var bc: Set = [ 2, 3, 6, 7,10 ]

print(bc.removeFirst())
