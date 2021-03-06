//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by Zhang Feng on 2017/5/24.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

import UIKit
import CoreData

class AreaTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var areas: [AreaMO] = [
    ]

    var fc: NSFetchedResultsController<AreaMO>!
    

 
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
        
        fetchAllData2()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        fetchAllData()
//        tableView.reloadData()
        
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case.update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        default:
            tableView.reloadData()
        }
        
        if let objects = controller.fetchedObjects{
            areas = objects as! [AreaMO]
        }
    }
    
    
    
    func fetchAllData2() {
        let request: NSFetchRequest<AreaMO> = AreaMO.fetchRequest()
        let sd = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sd]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegate.persistentContainer.viewContext
//        fc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        fc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        fc.delegate = self
        
        do {
            try fc.performFetch()
            if let objects = fc.fetchedObjects{
                areas = objects
                
            }
        } catch  {
            
            print(error)
        }
        
        
    }
    

//    func fetchAllData() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
//        do {
//            
//            areas = try appDelegate.persistentContainer.viewContext.fetch(AreaMO.fetchRequest())
//            
//        } catch  {
//            print(error)
//        }
//    }
//    
//    
    
    
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
            
//            self.areas.remove(at:indexPath.row)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let contex = appDelegate.persistentContainer.viewContext.delete(self.fc.object(at: indexPath))
            appDelegate.saveContext()
            
//            print("删除后剩下的区域", self.areas.count)
//            
//            for  area in areas {
//                print(area)
//            }
            
        //界面
        // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
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
        cell.thumbImageView.image = UIImage(data: areas[indexPath.row].image as! Data)
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
