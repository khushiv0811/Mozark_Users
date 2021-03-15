//
//  user_TVC.swift
//  Mozark_Users
//
//  Created by khushboo patel on 12/03/21.
//  Copyright © 2021 khushboo patel. All rights reserved.
//

import UIKit

class user_TVC: UITableViewCell
{
    /// Properties
    @IBOutlet weak var label_Name : UILabel!
    @IBOutlet weak var label_Age : UILabel!
    @IBOutlet weak var label_Gender: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
