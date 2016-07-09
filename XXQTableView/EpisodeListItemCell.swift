//
//  EpisodeListItemCell.swift
//  XXQTableView
//
//  Created by 夏祥全 on 16/7/9.
//  Copyright © 2016年 xiaxiangquan. All rights reserved.
//

import UIKit

class EpisodeListItemCell: UITableViewCell {
    
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var videoInfo: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
