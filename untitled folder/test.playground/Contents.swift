//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var addr :String? = "daxue"


//元祖
var People = (name:"zhang", age:18, grade:110)
People.name

print(People.1)

//元祖
let yuanzu = (100, "maju", 1)
yuanzu.1

//数组
var array1  = [1, 2, 3, 4, 5]

array1.append(8)

//array1.append(8)

for i in array1{

    print(i)
}


print("\(str)hello world")

//set
var cardnum: Set = [1,2,3]

cardnum.remove(1)


//字典

var dir = ["book":1, "name":222, "crade":18]

dir.count
dir["sex"] = 12

for i in dir{

    print(i)    //遍历

}

 print("________")

for key in dir.keys{
    print(key)
}


//switch

var temp = 30

switch temp {
case 0...10:
    print("haoleng")
default:
    print("haore")
}

//  类   继承父类 （父类加class，子类加上override）
class name{
    class var spard: String{
        return "ball"
    }
}

name.spard

class thing: name {
    override class var spard: String{
        
        return "bi"
    }
}

print(name.spard)

// 继承例子

class viechle{
    var speed = 0
    var des: String{
        return "speed is \(speed)!"
    }
    
    func makenose() {
        
        
    }
}

class bike: viechle{
    
    var hasbasket = false
    
}

var mybike = bike()
mybike.speed = 39
print(mybike.des)
mybike.hasbasket
mybike.makenose()







