import Cocoa

func add(a: Int, b: Int) -> Int {
    return a+b
}

func sub( a: Int, b: Int, sum:(( Int, Int ) -> Int )) {



}
let add1 = add( a: 10, b: 10)
print(add1)
sub(a: 30, b: 20) { ( a, b ) -> Int in
    return a-b
}
