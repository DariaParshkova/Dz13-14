//
//  LoginVC.swift
//  dz13
//
//  Created by Parshkova Daria on 07.03.2023.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    let textFieldForLogin = UITextField()
    let textFieldForPassword = UITextField()
    let toolBar = UIToolbar()
    
    let flexibleSpace = UIBarButtonItem()
    let doneButton = UIBarButtonItem()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTFforLogin(view: self)
        createTFforPass(view: self)
        createToolBar(view: self)
        let viewsArr = [textFieldForLogin, textFieldForPassword, toolBar]
        
        for view in viewsArr {
            self.view.addSubview(view)
        }
        

        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { nc in
            self.view.frame.origin.y = -50
        }
   
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) {
            nc in
            self.view.frame.origin.y = 0
        }
     
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textFieldForLogin.frame = CGRect(x: 20, y: 50 + view.safeAreaInsets.top, width: view.frame.size.width-40, height: 50)
        textFieldForPassword.frame = CGRect(x: 20, y:100 + view.safeAreaInsets.top, width: view.frame.size.width-40, height: 50)
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50)
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
        textFieldForLogin.tintColor = .blue
        textFieldForLogin.delegate = self
        //Krestic
        textFieldForLogin.clearButtonMode = .whileEditing
        textFieldForLogin.inputAccessoryView = toolBar
    }
    
    func createTFforPass(view:UIViewController) {
        //textFieldForPassword.frame = CGRect(x: 30, y: 160, width: 200, height: 34)
        textFieldForPassword.borderStyle = .roundedRect
        textFieldForPassword.placeholder = "Password"
        textFieldForPassword.tintColor = .blue
        textFieldForPassword.delegate = self
        //
        textFieldForPassword.clearButtonMode = .whileEditing
        textFieldForPassword.inputAccessoryView = toolBar
    }
   
    
    
    

    @objc func didTapDone() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldForLogin {
            textFieldForPassword.becomeFirstResponder()
        }
        return true
    }
    

    

}
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
}
