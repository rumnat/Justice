//
//  RegistrationViewController.swift
//  Justice
//
//  Created by Anton Muratov on 12/26/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

class RegistrationViewController: JBaseViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmsPasswordTextField: UITextField!

    // MARK: - IBActions
    @IBAction func registerDidTap(sender: AnyObject) {
        // Проверка заполнения полей и совпадения паролей
        if !isAllFieldAreFilled() && !isPasswordsMatch() {
            return
        }
        
        // Создаем пользователя с введенной информацией
        let user = User()
        user.name = nameTextField.text
        user.surname = surnameTextField.text
        user.phoneNumber = phoneTextField.text
        user.password = passwordTextField.text
        
        // Регестрируем на сервере
        weak var weakSelf = self
        APIClient.registerUser(user, success: { (AnyObject) -> Void in
            let alertview = UIAlertController(title: "", message: "Регистрация прошла успешно", preferredStyle: .Alert)
            alertview.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                alertview.dismissViewControllerAnimated(true, completion: nil)
            }))
            weakSelf!.presentViewController(alertview, animated: true, completion: nil)
            }) { () -> Void in
        }
    }
    
    // MARK: - Validators
    private func isAllFieldAreFilled() -> Bool {
        // Проверка заполнености полей
        if !nameTextField.hasText() ||
           !surnameTextField.hasText() ||
           !phoneTextField.hasText() ||
           !passwordTextField.hasText() ||
           !confirmsPasswordTextField.hasText() {
            
            let alertview = UIAlertController(title: "Ошибка", message: "Все поля должны быть заполнены", preferredStyle: .Alert)
            alertview.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                alertview.dismissViewControllerAnimated(true, completion: nil)
            }))
            presentViewController(alertview, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    private func isPasswordsMatch() -> Bool {
        // Проверка совпадения праолей
        if passwordTextField.text != confirmsPasswordTextField.text {
            let alertview = UIAlertController(title: "Ошибка", message: "Пароли не совпадают", preferredStyle: .Alert)
            alertview.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                alertview.dismissViewControllerAnimated(true, completion: nil)
            }))
            
            presentViewController(alertview, animated: true, completion: nil)
            
            return false
        }
        return true
    }
}
