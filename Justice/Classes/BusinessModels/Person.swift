//
//  Person.swift
//  Justice
//
//  Created by Anton Muratov on 12/26/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

enum Gender {
    case Male
    case Female
}

class Person: JObject {
    var fullName: String!
    var birthday: String!
    var lostDate: String!
    var gender: Gender!
    var photo: UIImage!
}
