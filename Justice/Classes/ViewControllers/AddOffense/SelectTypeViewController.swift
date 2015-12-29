//
//  SelectTypeViewController.swift
//  Justice
//
//  Created by Anton Muratov on 12/26/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

class SelectTypeViewController: JBaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var delegate: SelectTypeDelegate?
    var typesDataSource: [OffenseType]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Создание данных для типов
        typesDataSource = createTypesDataSouce()
    }
    
    // MARK: - UITableViewDelegate/DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typesDataSource.count // Количество типов
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Создание ячеек типов
        let offenseType = typesDataSource[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifiers.OffenseTypeCell, forIndexPath: indexPath)
        
        if let cellItem = cell as? OffenseTypeTableViewCell {
            cellItem.offenseType = offenseType
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Передача управления вызывающему контроллеру вместе с выбраным типом
        let type = typesDataSource[indexPath.row]
        
        if let delegateController = delegate {
            delegateController.selectTypeViewController(self, typeDidSelect: type)
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    // MARK: - Private
    private func createTypesDataSouce() -> [OffenseType] {
        // Создание данных типов
        var typesArray = [OffenseType]()
        
        let fireType = OffenseType(typeName: "Пожар", typeImage: UIImage(named: "pin_pozar")!)
        let drugsType = OffenseType(typeName: "Наркотики", typeImage: UIImage(named: "pin_narkota")!)
        let fightType = OffenseType(typeName: "Драка", typeImage: UIImage(named: "pin_draka")!)
        let quarrelType = OffenseType(typeName: "Семейная ссора", typeImage: UIImage(named: "pin_ssora")!)
        let robberyType = OffenseType(typeName: "Разбой", typeImage: UIImage(named: "pin_razboy")!)
        let theftType = OffenseType(typeName: "Воровство", typeImage: UIImage(named: "pin_vorovstvo")!)
        
        typesArray.append(fireType)
        typesArray.append(drugsType)
        typesArray.append(fightType)
        typesArray.append(quarrelType)
        typesArray.append(robberyType)
        typesArray.append(theftType)
        
        return typesArray
    }
}

// Протокол для отлавливания выбора типа
protocol SelectTypeDelegate {
    func selectTypeViewController(controller: SelectTypeViewController, typeDidSelect: OffenseType)
}
