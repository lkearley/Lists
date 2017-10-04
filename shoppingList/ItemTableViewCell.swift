//
//  ItemTableViewCell.swift
//  shoppingList
//
//  Created by Lauren Kearley on 10/3/17.
//  Copyright © 2017 LTK. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemChecked: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: functions
    func decorate(name: String, checked: Bool) {
        self.itemNameLabel.text = name
        if checked {
            itemChecked.text = "✅"
        } else {
            itemChecked.text = "❌"
        }
    }

}
