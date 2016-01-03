//
//  ViewController.swift
//  SlideTableCell
//
//  Created by zj on 16/1/1.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var tableViews: tableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let nav = UIView(frame: CGRectMake(0, 0, width_wd, cc * 64))
        nav.backgroundColor = UIColor.blackColor()
        self.view.addSubview(nav)

        let title = UILabel(frame: nav.bounds)
        title.textAlignment = .Center
        title.text = "省份"
        title.font = UIFont(name: "Arial", size: cc * 17)
        title.textColor = UIColor.whiteColor()
        nav.addSubview(title)
        
        let dataSource = ["北京" , "上海" , "天津" , "南京" , "浙江" , "安徽" ,"湖南"]
        let _tableView = tableView(frame: CGRectMake(0, 64, width_wd, cc * 308), style: UITableViewStyle.Plain)
        tableViews = _tableView
        tableViews.dataSour = dataSource
        tableViews.separatorStyle = UITableViewCellSeparatorStyle.None
        tableViews.registerClass(TableViewCell.self, forCellReuseIdentifier: "reuseCell")
        self.view.addSubview(tableViews)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

