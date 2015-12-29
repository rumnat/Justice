//
//  APIClient.swift
//  Justice
//
//  Created by Anton Muratov on 12/26/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

typealias Success = (Any?) -> Void
typealias Finalize = () -> Void

class APIClient: NSObject {
    
    class func sendOffense(success: Success, finalize: Finalize) -> Void {
        success(nil)
    }
    
    class func registerUser(user: User, success: Success, finalize: Finalize) -> Void {
        
    }
    
    class func fetchLostPersons(success: Success, finalize: Finalize) -> Void {
        var lostPersonsDataSource = [LostPerson]()
        
        let person1 = LostPerson()
        person1.fullName = "Бабак Сергей Иванович"
        person1.birthday = "25.09.1974"
        person1.lostDate = "18.10.2014"
        person1.gender = Gender.Male
        person1.age = 41
        person1.height = 178
        person1.job = "Механик"
        person1.lostDetails = "Ушел из дома"
        person1.photo = UIImage(named: "lost2")
        
        let person2 = LostPerson()
        person2.fullName = "Бурдыка Антон Александрович"
        person2.birthday = "05.02.1984"
        person2.lostDate = "23.05.2014"
        person2.gender = Gender.Male
        person2.age = 31
        person2.height = 192
        person2.job = "Слесарь"
        person2.lostDetails = "Ушел из дома"
        person2.photo = UIImage(named: "lost3")
        
        let person3 = LostPerson()
        person3.fullName = "Вагна Анна Валериевна"
        person3.birthday = "18.11.1950"
        person3.lostDate = "08.12.2015"
        person3.gender = Gender.Female
        person3.age = 65
        person3.height = 162
        person3.job = "Не работает"
        person3.lostDetails = "Ушла из дома"
        person3.photo = UIImage(named: "lost1")
        
        lostPersonsDataSource.append(person1)
        lostPersonsDataSource.append(person2)
        lostPersonsDataSource.append(person3)
        
        success(lostPersonsDataSource)
    }
    
    class func fetchWantedPersons(success: Success, finalize: Finalize) -> Void {
        var wantedPersonsDataSource = [WantedPerson]()
        
        let person1 = WantedPerson()
        person1.fullName = "Иванчук Илья Генадиевич"
        person1.birthday = "23.06.1970"
        person1.lostDate = "18.10.2014"
        person1.searchKind = "Государственный"
        person1.birthPlace = "Харьков"
        person1.photo = UIImage(named: "wanted1")
        
        let person2 = WantedPerson()
        person2.fullName = "Сулимовский Евгений Петрович"
        person2.birthday = "22.07.1973"
        person2.lostDate = "20.05.2012"
        person2.searchKind = "Государственный"
        person2.birthPlace = "Харьков"
        person2.photo = UIImage(named: "wanted2")

        let person3 = WantedPerson()
        person3.fullName = "Тарасенко Никита Эдуардович"
        person3.birthday = "04.07.1980"
        person3.lostDate = "03.01.2015"
        person3.searchKind = "Государственный"
        person3.birthPlace = "Харьков"
        person3.photo = UIImage(named: "wanted3")

        wantedPersonsDataSource.append(person1)
        wantedPersonsDataSource.append(person2)
        wantedPersonsDataSource.append(person3)
        
        success(wantedPersonsDataSource)
    }
    
    class func fetchOffenses(success: Success, finalize: Finalize) -> Void {
        var offenses = [Offense]()
        
        let offenseType1 = OffenseType(typeName: "Драка", typeImage: UIImage(named: "pin_draka")!)
        let offense1 = Offense()
        offense1.offenseType = offenseType1
        
        let offenseType2 = OffenseType(typeName: "Продажа наркотиков", typeImage: UIImage(named: "pin_narkota")!)
        let offense2 = Offense()
        offense2.offenseType = offenseType2
        
        let offenseType3 = OffenseType(typeName: "Пожар", typeImage: UIImage(named: "pin_pozar")!)
        let offense3 = Offense()
        offense3.offenseType = offenseType3
        
        let offenseType4 = OffenseType(typeName: "Ограбление", typeImage: UIImage(named: "pin_vorovstvo")!)
        let offense4 = Offense()
        offense4.offenseType = offenseType4
        
        let offenseType5 = OffenseType(typeName: "Семейная ссора", typeImage: UIImage(named: "pin_ssora")!)
        let offense5 = Offense()
        offense5.offenseType = offenseType5
        
        offenses.append(offense1)
        offenses.append(offense2)
        offenses.append(offense3)
        offenses.append(offense4)
        offenses.append(offense5)
        
        success(offenses)
    }
}
