//
//  ViewController.swift
//  XXQTableView
//
//  Created by 夏祥全 on 16/7/6.
//  Copyright © 2016年 xiaxiangquan. All rights reserved.
//

import UIKit

class XXQTableViewController: UITableViewController {

    var episodeListItems: [EpisodeListItem] = []
    var episodeListItemInfo = ["这样，Xcode就会把Epis","这样，Xcode就会把EpisodeListViewController嵌现一个新的空白区","这样，Xcode就会把EtViewController嵌套在一个UINavigati的方式的方式是对方的所发生的onController里了，","这样，Xcode就会把EtViewController嵌套在是否是对方的所发生的分的所发生的是否收到一个UINavigationController里了，","这样，Xcode就会把EtViewConter","这样，Xcode就会把EtViewConter"]
    func getEpisodeListItemData() {
        for i in 0...5 {
            let e = EpisodeListItem()
            e.title = "Episode -- \(i)"
            e.finished = i % 2 == 0 ? true:false
            self.episodeListItems.append(e)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadEpisodeListItems()
    }
    
    func loadEpisodeListItems() {
        let plistUrl = fileUrl("EpisodeList.plist")
        let fileExists = plistUrl.checkResourceIsReachableAndReturnError(nil)
        if fileExists {
            // 1. Creat a NSData by plistUrl
            let data = NSData(contentsOfURL: plistUrl)
            if data != nil {
                // 2. Creat a NSKeyedUnarchiver
                let unarchiver = NSKeyedUnarchiver(forReadingWithData:data!)
                
                // 3. Docode the object with key EpisodeListItems
                episodeListItems = unarchiver.decodeObjectForKey("EpisodeListItems") as! [EpisodeListItem]
                unarchiver.finishDecoding()
            }
        } else {
            getEpisodeListItemData()
            saveEpisodeListItems()
        }
    }
    
    func saveEpisodeListItems() {
        // 1. creat a concrete archiver  创造一个具体的存储服务器
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        
        // 2. Serialize object into archiver  序列化对象存储服务器
        archiver.encodeObject(episodeListItems, forKey: "EpisodeListItems")
        archiver.finishEncoding()
        
        /// 3. Creat the file
        data.writeToURL(fileUrl("EpisodeList.plist"), atomically: true)
        /*
         从上面的代码可以看到，把一个对象写入到plist大体分成三步：
         1、首先，我们创建一个NSMutableData对象，并且用它创建一个NSKeyedArchiver，这个archiver用来把我们要保存的内容编码到NSMutableData对象里；
         2、其次，我们把要保存的数组，用一个键值"EpisodeListItems"通过archiver进行编码，在这里，由于我们之前让EpisodeListItem遵从了NSCoding protocol，因此archiver会按照我们的要求，对数组里的内容进行编码；编码完成后，我们用finishedEncoding()通知archiver；
         3、此时，data里就包含编码过的我们要保存的内容了，我们使用writeToURL方法，直接把data写到我们指定的plist文件里；
         */
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func documentDirectory() -> NSURL {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[0]
    }
    
    func fileUrl(fileName: String) -> NSURL {
        let documentUrl = self.documentDirectory().URLByAppendingPathComponent(fileName)
        return documentUrl
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodeListItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> EpisodeListItemCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EpisodeItem", forIndexPath: indexPath) as! EpisodeListItemCell
        let lable = cell.episodeLabel
        if  self.episodeListItems.count > 0 {
            let title = self.episodeListItems[indexPath.row].title
            let state = self.episodeListItems[indexPath.row].finished
            lable.textColor = state ? UIColor.redColor() : UIColor.blackColor()
            lable.text = title;
            cell.videoInfo.text = self.episodeListItemInfo[indexPath.row]
        }
        return cell
    }

    // UITableViewDelegate
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print("sdsdfsfsfsdfds")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

