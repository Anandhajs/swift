import UIKit
//var a = [ Int ]()
//a.append(10)
//a.append(49)
//a.append(15)
//var b = a[ 1 ] + a[ 0 ]
//
//print ("the value of \(b)")
//print ( "the value of \(a[1])")
//print("the value is:\(a[2])")



class Games{
   var name: String
    var players: Int
    var time: String
    
    init(Games name: String, players: Int, time: String) {
        self.name = name
        self.players = players
        self.time = time
    }
    func play(){
        print("the \(name) is play")
    }
    func stop(){
    print("the \(name) is stop")
    }
    
}
let sports = Games(Games: "cricket", players: 11, time: "one hour")
sports.play()
let sports1 = sports
sports1.time = "three hours"
print("\(sports1.time)")

print("\(sports.time)")



struct game{
    var name: String
     var players: Int
     var time: String
     
     
     func play(){
         print("the \(name) is play")
     }
     func stop(){
     print("the \(name) is stop")
     }
}
let sports2 = game(name: "football", players: 7, time: "half hour")
var sports4 = sports2
sports4.name = "kabadi"
print(sports4.name)
print(sports2.name)
