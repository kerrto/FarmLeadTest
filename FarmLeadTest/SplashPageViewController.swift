//
//  SplashPageViewController.swift
//  FarmLeadTest
//
//  Created by Kerry Toonen on 2016-08-13.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class SplashPageViewController: UIViewController {
    
    var commodityCache = NSCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSelector(#selector(getCommodityUnits), withObject: nil, afterDelay: 3)

    }
    

    func getCommodityUnits() {
        

        
        let url = "http://dualstack.FL2-Dev-api02-1164870265.us-east-1.elb.amazonaws.com/api/v2/data"
        
        let parameters: [String: AnyObject] = [
            "data": ["commodityUnit" : "2013-04-25 18:03:12"]
        ]
        
        
        Alamofire.request(.POST, url, parameters: parameters, encoding: .JSON)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                    
                case .Success(let JSON):
                    
               
                    
                    let jsonDict : [String: AnyObject] = JSON as! [String : AnyObject]
                    
                    
                    
                    let dataDict = jsonDict["data"]
                    
                    let commodityUnits = dataDict?.objectForKey("commodityUnit")
                    
                    
                    //self.commodityCache.setObject(commodityUnits!, forKey: "commodityUnits")
                    
                    
                    NSCache.sharedInstance.setObject(commodityUnits!, forKey: "commodityUnits")
                   
                    
                    self.performSegueWithIdentifier("ToOnboarding", sender: self)
                    
                    
                    
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                    
                    let alertController = UIAlertController(title: "Network Problem", message: "There was a network error", preferredStyle: .Alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        // ...
                    }
                    alertController.addAction(OKAction)
                    
                    self.presentViewController(alertController, animated: true) {
                        // ...
                    }
                }
    
    
    }

}

}

extension NSCache {
    class var sharedInstance : NSCache {
        struct Static {
            static let instance : NSCache = NSCache()
        }
        return Static.instance
    }
}



