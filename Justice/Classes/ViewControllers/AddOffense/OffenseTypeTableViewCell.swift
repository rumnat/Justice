//
//  OffenseTypeTableViewCell.swift
//  Justice
//
//  Created by Anton Muratov on 12/26/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

class OffenseTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImageView: UIImageView!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    var offenseType: OffenseType! {
        set(type) {
            // Настройка типов правонарушений
            typeLabel.text = type.typeName
            typeImageView.image = type.typeImage
        }
        get {
            return nil
        }
    }
}
