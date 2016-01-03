//
//  TableViewCell.swift
//  SlideTableCell
//
//  Created by zj on 16/1/1.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

/// 自定义单元格
class TableViewCell: UITableViewCell {
    
    var title: UILabel!
    var boll: UIView!
    var lie: UIView!
    var data = ""
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseCell")
        title = UILabel(frame: CGRectMake(0, 0, width_wd, cc * 40))
        title.textColor = UIColor.blackColor()
        title.font = UIFont(name: "Arial", size: cc * 13)
        title.textAlignment = NSTextAlignment.Center
        self.contentView.addSubview(title)
        lie = UIView(frame: CGRectMake(0, 44 * cc - 0.5, width_wd, 0.5))
        lie.backgroundColor = UIColor(red: 224 / 255, green: 224 / 255, blue: 224 / 255, alpha: 1)
        lie.hidden = true
        self.contentView.addSubview(lie)
        boll = UIView(frame: CGRectMake(0, 0, cc * 25, cc * 25))
        boll.center = CGPoint(x: cc * 20, y: cc * 22)
        boll.hidden = true
        boll.layer.cornerRadius = cc * 25
        boll.backgroundColor = UIColor.redColor()
        self.contentView.addSubview(boll)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.title.text = self.data
        if self.data.hasSuffix("省"){
            boll.hidden = false
        }
        else{
            boll.hidden = true
        }
        if self.title.text == ""{
            lie.hidden = true
        }
        else{
            lie.hidden = false
        }
    }

}
