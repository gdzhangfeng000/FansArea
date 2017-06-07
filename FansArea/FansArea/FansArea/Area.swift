//
//  Area.swift
//  FansArea
//
//  Created by Zhang Feng on 2017/5/29.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

//import Foundation

struct Area{
    
    var name     : String
    var province : String
    var part     : String
    var image    : String
    var isVisited : Bool
    var rating = ""
    
    init(name: String, province: String, part: String, image: String, isVisited: Bool) {
        self.name = name
        self.province = province
        self.part = part
        self.image = image
        self.isVisited = isVisited
    }
}


