//
//  EpisodeListItem.swift
//  XXQTableView
//
//  Created by 夏祥全 on 16/7/6.
//  Copyright © 2016年 xiaxiangquan. All rights reserved.
//

import Foundation

class EpisodeListItem: NSObject {
    var title = ""
    var finished = false
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "Title")
        aCoder.encodeBool(finished, forKey: "Finished")
    }
    
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObjectForKey("Title") as! String
        finished = aDecoder.decodeBoolForKey("Finished")
        super.init()
    }

    required override init() {
        super.init()
    }
    
}
