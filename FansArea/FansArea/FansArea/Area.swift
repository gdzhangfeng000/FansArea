//
//  Area.swift
//  FansArea
//
//  Created by Zhang Feng on 2017/5/29.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

//import Foundation

struct Area {
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


//Area(name: "闵行区莘庄镇人民大街135号48楼4890", province: "上海", part: "华东", image: "xinzhuang", isVisited: false) ,
//Area(name: "兰州七里河区七里庄镇七天河村费佳火地36弄", province: "甘肃", part: "西北", image: "qilihe", isVisited: false) ,
//Area(name: "三明市尤溪县惠民乡劳动村西乡甲15号", province: "福建", part: "东南", image: "youxi", isVisited: false) ,
//Area(name: "西宁城西区香格里拉县昆仑阳光城5号楼，金新华乡", province: "青海", part: "西北", image: "chengxi", isVisited: false) ,
//Area(name: "广州白云区黄石东路江夏东二街200号（地铁2号线江夏站CC出口往右20米）", province: "广东", part: "华南", image: "baiyun", isVisited: false) ,
//Area(name: "闽侯县上街镇福建省福州市晋安区福马路168号07-08号店面", province: "福建", part: "华南", image: "shangjie", isVisited: false) ,
//Area(name: "哈尔滨市南岗区辰能溪树庭院位于南岗哈西大街117号，原制氧机厂厂", province: "黑龙江", part: "东北", image: "nangang", isVisited: false) ,
//Area(name: "临汾市尧渡区冰河路荣军康复医院", province: "山西", part: "华北", image: "yaodu", isVisited: false) ,
//Area(name: "成都武侯区四川成都武侯区倪家桥2号附8号站B出口", province: "四川", part: "西南", image: "wuhou", isVisited: false) ,
//Area(name: "汕头市金平区金港广场位于汕头市海滨路（西段）以北、至平路以东，居平路、外马路、南海横路以南，南海路、", province: "广东", part: "华南", image: "jinping", isVisited: false) ,
//Area(name: "长沙市芙蓉区湖南省长沙市芙蓉区张公岭亚大路99号", province: "湖南", part: "华中", image: "furong", isVisited: false)
