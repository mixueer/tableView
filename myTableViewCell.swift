//
//  myTableViewCell.swift
//  tableView
//
//  Created by mac on 15/12/25.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {
    
    var cellLabel = UILabel()
//    var title: String? {
//        didSet {
//            cellLabel.text = title
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView(){
        
        self.cellLabel = UILabel(frame: CGRectMake(30,0,SCWIDTH,SCHEIGHT))
        contentView.addSubview(cellLabel)
    }
}
