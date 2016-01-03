//
//  tableView.swift
//  SlideTableCell
//
//  Created by zj on 16/1/1.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

let cc = UIScreen.mainScreen().bounds.size.width / 360
let width_wd = UIScreen.mainScreen().bounds.width
class tableView: UITableView,UITableViewDataSource,UITableViewDelegate {
    
    var dataSour: [AnyObject] = []
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: UITableViewStyle.Plain)
        self.dataSource = self
        self.delegate = self
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSour.count
    }
    override func numberOfRowsInSection(section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44 * cc
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseCell", forIndexPath: indexPath) as? TableViewCell
        if cell == nil{
            cell = TableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseCell")
        }
        else{
             cell!.data = self.dataSour[indexPath.row] as! String
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        /// 删除
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "删除") { (action, indexPath) -> Void in
            self.dataSour.removeAtIndex(indexPath.row)
            self.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Bottom)
        }
        deleteAction.backgroundColor = UIColor.redColor()
        /// 置顶
        let topAction = UITableViewRowAction(style: .Default, title: "置顶") { (action, indexPath) -> Void in
            
            if indexPath != 0{
                
                let temp = self.dataSour[indexPath.row] as? String
                self.dataSour.removeAtIndex(indexPath.row)
                self.dataSour.insert(temp!, atIndex: 0)
                let firstIndex = NSIndexPath(forRow: 0, inSection: indexPath.section)
                self.moveRowAtIndexPath(indexPath, toIndexPath: firstIndex)
                self.reloadRowsAtIndexPaths([indexPath ,firstIndex], withRowAnimation: UITableViewRowAnimation.Middle)
            }
            else{
                self.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Middle)
            }
            
        }
        
        topAction.backgroundColor = UIColor.brownColor()
        /// 更新
        let adertAction = UITableViewRowAction(style: .Default, title: "更新内容") { (action, indexPath) -> Void in
            let temp  =  self.dataSour[indexPath.row] as? String
            if temp!.hasSuffix("省"){
                var Newtemp = ""
                for  i in temp!{
                    if i == "省"{
                        break
                    }
                    Newtemp.append(i)
                }
                self.dataSour[indexPath.row] = Newtemp
            }
            else{
                self.dataSour[indexPath.row] = temp! + "省"
            }
            
            
            self.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            
        }
        adertAction.backgroundColor = UIColor.orangeColor()
        return [deleteAction,topAction,adertAction]
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }

}
