//
//  DetailTableViewController.swift
//  FansArea
//
//  Created by 123 on 2017/6/4.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var ratingBtn: UIButton!
    
    @IBOutlet weak var LargeImageView: UIImageView!
    
    
    var area: AreaMO!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景颜色
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        //移除空行和分割线颜色
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        
        //在viewDidLoad方法里加入
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //设置行高自适应
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //每一页的头显示地区名称
        self.title = area.name
        
        
        
        
        LargeImageView.image = UIImage(data: area.image as! Data)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    //单元格内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeatilCell", for: indexPath) as! DetailTableViewCell
        
        //单元格颜色
        cell.backgroundColor = UIColor.clear
        
        
        
        
        
        switch indexPath.row {
        case 0:
            cell.FiledLable.text = "地名"
            cell.ValueLable.text = area.name
        case 1:
            cell.FiledLable.text = "省"
            cell.ValueLable.text = area.province
        case 2:
            cell.FiledLable.text = "地区"
            cell.ValueLable.text = area.part
        case 3:
            cell.FiledLable.text = "去过与否"
            cell.ValueLable.text = area.isVisited ? "去过" : "没过去"
            
        default:
            break
        }

        // Configure the cell...

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
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showMap"{
            let destVC = segue.destination as! MapViewController
            destVC.area = self.area
        }
 
    }
    //返回按钮 判断如果有选择评价，则图标更换
    @IBAction func close (segue: UIStoryboardSegue)  {
        let reviewVC = segue.source as! ReviewViewController
        
        if let rating = reviewVC.rating{
            self.area.rating = rating
            self.ratingBtn.setImage(UIImage(named: rating), for: .normal)
        }
    }

}
