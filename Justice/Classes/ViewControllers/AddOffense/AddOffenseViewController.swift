//
//  AddOffenseViewController.swift
//  Justice
//
//  Created by Anton Muratov on 12/13/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit


class AddOffenseViewController: JBaseViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
SelectTypeDelegate {

    @IBOutlet weak var typesTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!

    var selectedType: OffenseType!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.layer.borderColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5).CGColor
    }
    
    // MARK: - IBActions
    @IBAction
    func addPhotoDidTap(sender: AnyObject) {
        // Обработка добавления фото
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }

    @IBAction func selectTypeDidTap(sender: AnyObject) {
        // Обработка выбора типа
        if let typesField = sender as? UITextField {
            typesField.resignFirstResponder()
        }
        
        performSegueWithIdentifier(Segues.AddOffenceViewController.ShowTypesSegue, sender: nil)
    }
    
    @IBAction func sendOffenseDidTap(sender: AnyObject) {
        // Формирование текущего времени
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDateString = dateFormatter.stringFromDate(currentDate)
        
        // Создание правонарушения
        let offense = Offense()
        offense.offenseType = selectedType
        offense.offenseDescription = descriptionTextView.text
        offense.photos.append(firstImage.image!)
        offense.photos.append(secondImage.image!)
        offense.time = dateTextField.hasText() ? dateTextField.text : currentDateString
        offense.address = addressTextField.text
        
        // Отправка правонарушения на сервер
        weak var weakSelf = self
        APIClient.sendOffense({ (AnyObject) -> Void in
            let alertView = UIAlertController(title: "", message: "Запрос был доставлен успешно", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                alertView.dismissViewControllerAnimated(true, completion: nil)
            }
            
            alertView.addAction(OKAction)
            
            weakSelf!.presentViewController(alertView, animated: true, completion: nil)
            }) { () -> Void in
                
        }
    }

    // MARK: - SelectTypeDelegate
    
    func selectTypeViewController(controller: SelectTypeViewController, typeDidSelect: OffenseType) {
        // Обратный вызов обработки выбранного типа правонарушения
        selectedType = typeDidSelect
        typesTextField.text = typeDidSelect.typeName
    }
    
    // MARK: - Navigations
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Переход к выбору типа
        if segue.identifier == Segues.AddOffenceViewController.ShowTypesSegue {
            if let selectTypeVC = segue.destinationViewController as? SelectTypeViewController {
                selectTypeVC.delegate = self
            }
        }
    }

}
