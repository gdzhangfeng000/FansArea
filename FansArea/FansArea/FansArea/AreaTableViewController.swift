//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by Zhang Feng on 2017/5/24.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
    
    var areas     = [
        
        Area(name: "闵行区莘庄镇人民大街135号48楼4890", province: "上海", part: "华东", image: "xinzhuang", isVisited: false) ,
        Area(name: "兰州七里河区七里庄镇七天河村费佳火地36弄", province: "甘肃", part: "西北", image: "qilihe", isVisited: false) ,
        Area(name: "三明市尤溪县惠民乡劳动村西乡甲15号", province: "福建", part: "东南", image: "youxi", isVisited: false) ,
        Area(name: "西宁城西区香格里拉县昆仑阳光城5号楼，金新华乡", province: "青海", part: "西北", image: "chengxi", isVisited: false) ,
        Area(name: "广州白云区黄石东路江夏东二街200号（地铁2号线江夏站CC出口往右20米）", province: "广东", part: "华南", image: "baiyun", isVisited: false) ,
        Area(name: "闽侯县上街镇福建省福州市晋安区福马路168号07-08号店面", province: "福建", part: "华南", image: "shangjie", isVisited: false) ,
        Area(name: "哈尔滨市南岗区辰能溪树庭院位于南岗哈西大街117号，原制氧机厂厂", province: "黑龙江", part: "东北", image: "nangang", isVisited: false) ,
        Area(name: "临汾市尧渡区冰河路荣军康复医院", province: "山西", part: "华北", image: "yaodu", isVisited: false) ,
        Area(name: "成都武侯区四川成都武侯区倪家桥2号附8号站B出口", province: "四川", part: "西南", image: "wuhou", isVisited: false) ,
        Area(name: "汕头市金平区金港广场位于汕头市海滨路（西段）以北、至平路以东，居平路、外马路、南海横路以南，南海路、", province: "广东", part: "华南", image: "jinping", isVisited: false) ,
        Area(name: "长沙市芙蓉区湖南省长沙市芙蓉区张公岭亚大路99号", province: "湖南", part: "华中", image: "furong", isVisited: false)
        
    ]

    
//    var areaImage = [
//    
//        "xinzhuang", "qilihe", "youxi", "chengxi", "baiyun", "shangjie", "nangang", "yaodu", "wuhou", "jinping",
//        "furong"
//    
//    ]
//    
//    var provinces = ["上海", "甘肃", "福建", "青海", "广东", "福建", "黑龙江", "山西", "四川", "广东", "湖南"]
//    
//    var parts     = ["华东", "西北", "东南", "西北", "华南", "华南", "东北",   "华北", "西南", "华南", "华中"]
//    
//    
//    var visit     = [Bool](repeatElement(false, count: 11))
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //列表页行高也自适应
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //返回按钮的样式,只有箭头
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

//【有没有内存警告⚠️】
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Table view delegate (选中图表代表)
    // 本例子提供两个提示框——请2选1
    
    
    
//【选择了哪一组哪一行】
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("你点击了",indexPath.section+1, "组", indexPath.row+1, "行")
      
        
        
    //（中部提示框）
     /*
        //菜单设定
        //选项1:确定
        //选项2:取消
        let menu    = UIAlertController(title: "菜单", message: "您点击了\(indexPath.row)行", preferredStyle: .alert)
        let option  = UIAlertAction(title: "确定", style: .default, handler: nil)
        let option2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
         
        //(添加动作)
        menu.addAction(option)
        menu.addAction(option2)
    
    */

    
    
    //（底部提示框）
        
        //菜单设定
        //选项1:取消
        //选项2:选项后面打勾
        let menu    = UIAlertController(title: "菜单", message: "您点击了\(areas[indexPath.row])", preferredStyle: .actionSheet)
        let option  = UIAlertAction(title: "取消", style: .default, handler: nil)
        let option2 = UIAlertAction(title: "我去过", style: .destructive) { (_) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.visit[indexPath.row] = true
         }
    
        //(添加动作)
        menu.addAction(option)
        menu.addAction(option2)
        
        
        
        //(动画)
        self.present(menu, animated: true, completion: nil)
        
        //(取消选中——“选中后本来颜色变成蓝色，开启本项便会白色”)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    */
    
 
 
//【添加分享删除菜单】
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //(分享按钮)
        let actionShare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let actionSheet = UIAlertController(title: "分享", message: nil, preferredStyle: .actionSheet)
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "微信", style: .default, handler: nil)
            let option3 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
         
            actionSheet.addAction(option1)
            actionSheet.addAction(option2)
            actionSheet.addAction(option3)
            
            self.present(actionSheet, animated: true, completion: nil)
            
        }
        
        //（设置按钮颜色）
        actionShare.backgroundColor = UIColor.orange
        
        
        //(删除按钮)
        let actionDel = UITableViewRowAction(style: .destructive, title: "删除") { (_, indexPath) in
            
            self.areas.remove(at:indexPath.row)
            
            
//            print("删除后剩下的区域", self.areas.count)
//            
//            for  area in areas {
//                print(area)
//            }
            
        //界面
        // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        //(置顶按钮)
        let actionTop = UITableViewRowAction(style: .default, title: "置顶") { (_, _) in
            
            
        }
        
        actionTop.backgroundColor = UIColor(red: 245/255, green: 199/245, blue: 221/255, alpha: 1)
        
        
            
            return [actionShare, actionDel, actionTop]
        
    }

    
    // MARK: - Table view data source (数据内容)
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    
    
    
//【行数用area的数量】
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return areas.count
    }

    //（单元格内容）
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
    //（描述部分内容）
        cell.provinceLable.text = areas[indexPath.row].province
        cell.partLable.text = areas[indexPath.row].part
        
    //（图像部分内容）
        cell.nameLable.text = areas[indexPath.row].name
        cell.thumbImageView.image = UIImage(named: areas[indexPath.row].image)
        cell.thumbImageView.layer.cornerRadius = cell.thumbImageView.frame.size.height/2
        cell.thumbImageView.clipsToBounds = true
    
    //(解决向下拉的时候后面的选项会自动打勾)
//        if visit[indexPath.row] {
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        
        cell.accessoryType = areas[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


/*
//【删除行同时删除数据内容和界面】
    
    //数据
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.areas.remove(at:indexPath.row)
            
            print("删除后剩下的区域", self.areas.count)
            
            for  area in areas {
                print(area)
            }
            
    //界面
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
*/
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    @IBAction func close(segue: UIStoryboard)  {
        
    }
    
    
    
    
    // MARK: - Navigation (导航)

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showAreaDetail"{
            
            let dest = segue.destination as! DetailTableViewController
            dest.area = areas[tableView.indexPathForSelectedRow!.row]
            
        }
        
    }

}
