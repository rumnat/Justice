//
//  WantedViewController.swift
//  Justice
//
//  Created by Anton Muratov on 12/24/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

class WantedViewController: JBaseViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    
    var lostPersons: [LostPerson]!
    var wantedPersons: [WantedPerson]!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        fetchData()
        
        // Авто высота ячеек
        tableView.estimatedRowHeight = 90.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Количество ячеек для каждой из секций
        if segmentedControll.selectedSegmentIndex == 0 {
            if let persons = lostPersons {
                return persons.count
            } else {
                return 0
            }
        } else {
            if let persons = wantedPersons {
                return persons.count
            } else {
                return 0
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Создание ячеек для соответствующих секций
        var cell: UITableViewCell!
        
        if segmentedControll.selectedSegmentIndex == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifiers.LostCell, forIndexPath: indexPath)
            if let lostCell = cell as? LostTableViewCell {
                lostCell.lostPerson = lostPersons[indexPath.row]
            }
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifiers.WantedCell, forIndexPath: indexPath)
            if let wantedCell = cell as? WantedTableViewCell {
                wantedCell.wantedPerson = wantedPersons[indexPath.row]
            }

        }
        
        return cell
    }
    
    // MARK: - IBActions
    
    @IBAction func segmentControllValueDidChange(sender: AnyObject) {
        // Обработка смены типа искомых людей
        tableView.reloadData()
    }
    
    // MARK: - Requests
    
    private func fetchData() -> Void {
        // Получения данных о особах которые в розыске и которые потерялись
        APIClient.fetchLostPersons({ (response) -> Void in
            if let responseLosts = response as? [LostPerson] {
                
                // Сортируем список розыскиваемых по имени пузырьковым методом
//                for index1 in 0...responseLosts.count - 1 {
//                    for index2 in 0...responseLosts.count - 1 {
//                        if responseLosts[index1].fullName > responseLosts[index2].fullName {
//                            let tempValue = responseLosts[index1]
//                            responseLosts[index1] = responseLosts[index2]
//                            responseLosts[index2] = tempValue
//                        }
//                    }
//                }
                
                self.lostPersons = responseLosts
            }
            }) { () -> Void in
                
        }
        
        APIClient.fetchWantedPersons({ (response) -> Void in
            if let responseWanteds = response as? [WantedPerson] {
                self.wantedPersons = responseWanteds
            }
            }) { () -> Void in
                
        }
    }
}


