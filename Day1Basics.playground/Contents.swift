import UIKit

var str = "Hello, playground"

func fact(num:Double) -> Double{
    var x = num
    if x>1 {
        x-=1
        return num*fact(num:x)
    }
    else{
        return 1
        
    }
    
}


func power(num:Double,pow:Int) -> Double{
    var x = num
    
    for _ in 1...pow-1 {
        x*=num
    }
    return x
}

func minMax(array:[Int]) -> (min:Int,max:Int)?{
    if array.isEmpty {return nil}
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        if value < currentMin {
            currentMin = value
        }
        if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}


func swap(num1:inout Int ,num2:inout Int){
    let t = num1
    num1 = num2
    num2 = t
}




func sortArray(array1:[Int])->[Int]{
    var array = array1
    var last_position = array.count - 1
    var swap = true
    while swap == true {
        swap = false
        for i in 0..<last_position {
            if array[i] > array[i + 1] {
                let temp = array[i + 1]
                array[i+1] = array[i]
                array[i] = temp
                swap = true
            }
        }
    }
    return array
}



var x = fact(num:3)

print(x)
print(power(num:2,pow:3))

var (min,max) = minMax(array:[1,5,3,5,2,8,9,3])!

print("min is \(min) and max is \(max)")


var num1=10
var num2=7
swap(num1:&num1, num2:&num2)

print("num1 is \(num1)  and num2 is \(num2)")


print(sortArray(array1:[1,5,3,5,2,8,9,3]))
