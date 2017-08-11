//
//  ViewController.swift
//  Webservises
//
//  Created by infinium on 29/07/17.
//  Copyright (c) 2017 infinium. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var tableweb: UITableView!
    var refrenceArray1:NSMutableArray = NSMutableArray()
    var refrenceArray2:NSMutableArray = NSMutableArray()

    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        let url:NSURL = NSURL(string:"http://www.4ambuch.com/purepolitics_api/getStates.php")!
        let datajson:NSData = NSData(contentsOfURL: url)!
        let error:NSError?=nil
        let jsonobject:AnyObject = NSJSONSerialization.JSONObjectWithData(datajson, options: NSJSONReadingOptions(0), error: nil)!
        
        var dataDict:NSDictionary = jsonobject as NSDictionary
        print(dataDict)
        refrenceArray1 = dataDict.valueForKey("ministries") as NSMutableArray
         refrenceArray2 = dataDict.valueForKey("states")  as NSMutableArray
       
        print(refrenceArray1)
        print(refrenceArray2)

        
    }
   func numberOfSectionsInTableView(tableView: UITableView) -> Int
   {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(section == 1)
        {
            return refrenceArray1.count
        }
        else
        {
            return refrenceArray2.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as WebTableViewCell
        
        if(indexPath.section == 1)
        {
            cell.Lbldata.text = refrenceArray1[indexPath.row].objectForKey("ministry") as? String
        }
        else
        {
            cell.Lbldata.text = refrenceArray2[indexPath.row].objectForKey("Name") as? String
        }

        return cell
    }
    

    
    
   // NSString. returnJsonString:(NSDictionary *)params
//    {
//    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params
//    options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
//    error:&error];
//    NSString *jsonString;
//    if (! jsonData) {
//    NSLog(@"Got an error: %@", error);
//    } else {
//    jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//    
//    return jsonString;
//    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

