//
//  LostTableViewCell.swift
//  Justice
//
//  Created by Anton Muratov on 12/26/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

class LostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lostImage: UIImageView!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heghtLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var lostDateLabel: UILabel!
    @IBOutlet weak var lostDetailLabel: UILabel!
    
    var lostPerson: LostPerson! {
        set(person) {
            // Заполнение ячеек полученной информацией о потеряном
            lostImage.image = person.photo
            nameLabel.text?.appendContentsOf(person.fullName)
            birthdayLabel.text?.appendContentsOf(person.birthday)
            genderLabel.text?.appendContentsOf(person.gender == Gender.Male ? "Мужской" : "Женский")
            ageLabel.text?.appendContentsOf("\(person.age)")
            heghtLabel.text?.appendContentsOf("\(person.height)")
            jobLabel.text?.appendContentsOf(person.job)
            lostDateLabel.text?.appendContentsOf(person.lostDate)
            lostDetailLabel.text?.appendContentsOf(person.lostDetails)
        }
        get {
            return nil
        }
    }

}
