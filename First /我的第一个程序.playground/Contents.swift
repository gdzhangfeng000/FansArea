//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let buyButton = UILabel(frame: CGRect(x:0, y:0, width:200, height:50) )

buyButton.text = "立即购买"

buyButton.textColor = UIColor.white

buyButton.backgroundColor = UIColor.gray

buyButton.textAlignment = .center

buyButton.layer.cornerRadius = 10
buyButton.clipsToBounds = true

buyButton
