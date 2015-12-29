//
//  WantedTableViewCell.swift
//  Justice
//
//  Created by Anton Muratov on 12/24/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

class WantedTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var lostDateLabel: UILabel!
    @IBOutlet weak var searchKindLabel: UILabel!
    @IBOutlet weak var birthPlaceLabel: UILabel!
    
    var wantedPerson: WantedPerson! {
        set(person) {
            // Заполнение ячеек полученной информацией о розыскеваемом
            photoImageView.image = person.photo
            nameLabel.text?.appendContentsOf(person.fullName)
            birthdayLabel.text?.appendContentsOf(person.birthday)
            lostDateLabel.text?.appendContentsOf(person.lostDate)
            searchKindLabel.text?.appendContentsOf(person.searchKind)
            birthPlaceLabel.text?.appendContentsOf(person.birthPlace)
        }
        get {
            return nil
        }
    }
}
