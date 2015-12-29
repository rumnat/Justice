//
//  OffenseType.swift
//  Justice
//
//  Created by Anton Muratov on 12/26/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

class OffenseType: JObject {
    var typeName: String!
    var typeImage: UIImage!
    
    init(typeName: String, typeImage: UIImage) {
        self.typeName = typeName
        self.typeImage = typeImage
    }
}
