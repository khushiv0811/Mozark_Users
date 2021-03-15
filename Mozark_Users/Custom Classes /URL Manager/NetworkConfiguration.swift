//
//  user_TVC.swift
//  Mozark_Users
//
//  Created by khushboo patel on 12/03/21.
//  Copyright © 2021 khushboo patel. All rights reserved.
//


import UIKit

/// Network configuration.
class NetworkConfiguration: NSObject {
    
    // MARK: - Variables
    ///
    var hostURL: String = "https://randomuser.me/"
    
    
    
    // MARK: - Init
    /// Initializers
    fileprivate override init()
    {
       
        super.init()
    }
    
    /// for NetworkConfiguration
    class var shared: NetworkConfiguration
    {
        ///
        struct Static
        {
            ///
            static var instance: NetworkConfiguration?
        }
        if Static.instance == nil {
            Static.instance = NetworkConfiguration()
        }
        return Static.instance ?? NetworkConfiguration() // change
    }
    
    ///
   
    }


