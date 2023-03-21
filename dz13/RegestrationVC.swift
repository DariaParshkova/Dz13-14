//
//  RegestrationVC.swift
//  dz13
//
//  Created by Parshkova Daria on 07.03.2023.
//

import UIKit

class RegestrationVC: UIViewController, UITextFieldDelegate {
    let textFieldForLogin = UITextField()
    let textFieldForPassword = UITextField()
    let textFieldForPhone = UITextField()
    let toolBar = UIToolbar()
    let flexibleSpace = UIBarButtonItem()
    let doneButton = UIBarButtonItem()
    let regButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        notifacationCenter()
        createTFforLogin(view: self)
        createTFforPass(view: self)
        createTFForPhone(view: self)
        createToolBar(view: self)
        createRegButton(view: self)
        let viewArr = [textFieldForPhone, textFieldForPassword, textFieldForLogin, regButton]
        
        for view in viewArr {
            self.view.addSubview(view)
        }
        
        
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textFieldForLogin.frame = CGRect(x: 20, y: 50 + view.safeAreaInsets.top, width: view.frame.size.width-40, height: 50)
        textFieldForPassword.frame = CGRect(x: 20, y:100 + view.safeAreaInsets.top, width: view.frame.size.width-40, height: 50)
        textFieldForPhone.frame = CGRect(x: 20, y: 150 + view.safeAreaInsets.top, width: view.frame.size.width-40, height: 50)
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50)
    }
    func notifacationCenter() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { nc in
            self.view.frame.origin.y = -50
            }
   
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) {
            nc in
            self.view.frame.origin.y = 0
            }
        }
    func createToolBar(view:UIViewController) {
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action:nil )
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        toolBar.items = [flexibleSpace, doneButton]
        
    }
    func createTFforLogin(view:UIViewController) {
        //textFieldForLogin.frame = CGRect(x: 30, y: 90, width: 200, height: 34)
        textFieldForLogin.borderStyle = .roundedRect
        textFieldForLogin.placeholder = "login"
        //textFieldForLogin.tintColor = .blue
        textFieldForLogin.delegate = self
        textFieldForLogin.clearButtonMode = .whileEditing
        textFieldForLogin.inputAccessoryView = toolBar
    }
    
    func createTFforPass(view:UIViewController) {
        //textFieldForPassword.frame = CGRect(x: 30, y: 160, width: 200, height: 34)
        textFieldForPassword.borderStyle = .roundedRect
        textFieldForPassword.placeholder = "Password"
        //textFieldForPassword.tintColor = .blue
        textFieldForPassword.delegate = self
        textFieldForPassword.clearButtonMode = .whileEditing
        textFieldForPassword.inputAccessoryView = toolBar
    }
    func createTFForPhone(view:UIViewController) {
        textFieldForPhone.borderStyle = .roundedRect
        textFieldForPhone.placeholder = "Phone"
        textFieldForPhone.delegate = self
        textFieldForPhone.clearButtonMode = .whileEditing
        textFieldForPhone.inputAccessoryView = toolBar
    
    }
    func createRegButton(view:UIViewController) {
        regButton.frame = CGRect(x: 120, y: 320, width: 100, height: 30)
        regButton.setTitle("Regitration", for: .normal)
        regButton.setTitleColor(.blue, for: .normal)
        regButton.backgroundColor = .lightGray
        regButton.layer.cornerRadius = 3
        regButton.addTarget(self, action: #selector(enterRegTpd), for: .touchUpInside)
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    //перескакиваем на след поле и убираем клавиатуру при нажатии на enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldForLogin {
            textFieldForPassword.becomeFirstResponder()
        } else if textField == textFieldForPassword {
            textFieldForPassword.becomeFirstResponder()
        } else if textField == textFieldForPhone {
            textFieldForPhone.resignFirstResponder()
        }
       
        return true
    }
    
    @objc func didTapDone() {
        view.endEditing(true)
    }
    //проверка допустимых символов
    @objc func enterRegTpd() {
        if let email = textFieldForLogin.text, let password = textFieldForPassword.text, let phone = textFieldForPhone.text {
            if email == "" && password == "" && phone == "" {
                UtilityFunction().simpleAlert(vc: self, title: "Alert!", message: "Please enter Login and Password and Phone")
            } else {
                if !email.isVilidEmail(email: email) {
                    UtilityFunction().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Vilid Login")
                } else if !password.isVilidPassword(password: password) {
                    UtilityFunction().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Vilid Password")
                } else if !phone.isVilidPhone(phone: phone) {
                    UtilityFunction().simpleAlert(vc: self, title: "Alert", message: "Please enter vilid phone")
                }
                
                
                else {
                    UtilityFunction().showSimpleAlert(vc: self, title: "Alert!", message: "Succesful!") { action in
                        //let loginVc = LoginVC()
                        self.navigationController?.popViewController(animated: true)
                        /*
                        let appVc = AppVC()
                        self.navigationController?.pushViewController(appVc, animated: true)*/
                    }
                }
            }
        }
    }
}
//допустимые символы для пароля и логина
extension String {
    func isVilidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    func isVilidPassword(password:String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
    func isVilidPhone(phone:String) -> Bool {
        let phoneRegEx = ".*[0-9].*"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@",phoneRegEx )
        let result = phoneTest.evaluate(with: phone)
        return result
    }
}
