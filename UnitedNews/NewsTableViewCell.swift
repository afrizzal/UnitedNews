//
//  NewsTableViewCell.swift
//  UnitedNews
//
//  Created by Afrizzal on 13/07/21.
//

import UIKit

class NewsTableViewCell: NSObject {
    static let identifier = "NewsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
    }
}
