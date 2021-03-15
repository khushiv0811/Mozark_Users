//
//  user_TVC.swift
//  Mozark_Users
//
//  Created by khushboo patel on 12/03/21.
//  Copyright © 2021 khushboo patel. All rights reserved.
//


import UIKit

/// Manage API List
class APIList: NSObject {
    ///
    static let serverPath = NetworkConfiguration.shared.hostURL
   
    /// Square Inventory Check API
    struct users
    {
        ///
        static let users = serverPath +  "api"
    }
    
}
