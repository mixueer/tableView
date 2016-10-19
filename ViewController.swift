//
//  ViewController.swift
//  tableView
//
//  Created by mac on 15/12/25.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myTableView = UITableView()
    var baby = [["宝宝0","宝宝1","宝宝2","宝宝3"],["宝宝4","宝宝5","宝宝6","宝宝7"],["宝宝8","宝宝9","宝宝10","宝宝11"]]
//    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 13/255.0, green: 176/255.0, blue: 155/255.0, alpha: 1.0)
        
//        UINavigationBar.appearance().barTintColor = UIColor(red: 13/255.0, green: 176/255.0, blue: 155/255.0, alpha: 1.0)
//        let mainClolor = UIColor(red: 13/255.0, green: 176/255.0, blue: 155/255.0, alpha: 1.0)
//        self.navigationController?.navigationBar.barTintColor = mainClolor
//        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationItem.title = "tableview练习"
        let navigationTitl:NSDictionary = NSDictionary(object: UIColor.blackColor(), forKey: NSForegroundColorAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitl as? [String:AnyObject]
        
        self.setView()
    }
    
    func setView(){
        
        self.myTableView = UITableView(frame: CGRectMake(30, 100, SCWIDTH - 60, SCHEIGHT - 150), style: .Plain)
//        self.myTableView.registerClass(myTableViewCell.self, forCellReuseIdentifier: "myCell")
        self.myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.tableFooterView = UIView()
        self.view.addSubview(myTableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    ////绘制Cell,用数据元填充cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identify:String = "myCell"
        
        let cell = myTableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as! UITableViewCell
//        let cell = myTableView.dequeueReusableCellWithIdentifier(identify) as? UITableViewCell
        if !baby[indexPath.section][indexPath.row].isEmpty{
            cell.textLabel!.text = baby[indexPath.section][indexPath.row]//viewModel.titleForRow(indexPath.row)
        }
        
//        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
//        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        return cell
    }
    //点击cell的触发事件
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.myTableView.deselectRowAtIndexPath(indexPath, animated: true)
//        let alertViewController:UIAlertController = UIAlertController(title:"提示", message:baby[indexPath.row], preferredStyle: UIAlertControllerStyle.Alert);
//        
//        let alertView = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
//        
//        alertViewController.addAction(alertView);
//        self.presentViewController(alertViewController, animated: true, completion: nil);
//    }
    //返回每个cell的高度,改变行的高度（实现主个代理方法后 rowHeight 设定的高度无效）
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    //返回的分区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baby.count
    }
    //返回表格cell的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baby[section].count//viewModel.rowCounts()
    }
    //返回分区的头部
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "分区"
    }
    //每个section底部标题高度（实现这个代理方法后前面 sectionHeaderHeight 设定的高度无效）
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    //返回分区的尾部
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "尾部"
    }
    //每个section头部标题高度（实现这个代理方法后前面 sectionFooterHeight 设定的高度无效）
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40.0
    }
    // 在tableview 的headView 上添加个view 其实你可以在这个view 加很多组件 在添加在HeadView
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
//        
//        let view:UIView = UIView(frame: CGRectMake(0, 0,self.view.frame.size.width, 30));
//        view.backgroundColor = UIColor.yellowColor();
//        
//        return  view
//        
//    }
    //在footerView 添加个button
//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
//        
//        let myButton:UIButton = UIButton(frame: CGRectMake(0, 0, self.view.frame.size.width, 40));
//        myButton.setTitle("I am a Button", forState: UIControlState.Normal);
//        myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal);
//        myButton.backgroundColor = UIColor.greenColor();
//        return myButton
//    }
    //分享和删除功能的实现
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {
            (action: UITableViewRowAction,indexPath: NSIndexPath) -> Void in
            let menu = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Cancel, handler: nil)
            let facebookAction = UIAlertAction(title: "facebook", style: UIAlertActionStyle.Default, handler: nil)
            
            let twitterAction = UIAlertAction(title: "twitter", style: UIAlertActionStyle.Default, handler: nil)
            menu.addAction(facebookAction)
            menu.addAction(twitterAction)
            menu.addAction(cancelAction)
            self.presentViewController(menu, animated: true, completion: nil)
        })
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {
            (action: UITableViewRowAction,indexPath: NSIndexPath) -> Void in
            self.baby[indexPath.section].removeAtIndex(indexPath.row)
//            self.babyImage.removeAtIndex(indexPath.row)
            //self.myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            self.myTableView.reloadData()
        })
        
        return [shareAction,deleteAction]
    }
    //行缩进
//    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
//        return indexPath.row
//    }
}

