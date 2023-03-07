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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTFforLogin(view: self)
        createTFforPass(view: self)
        let viewsArr = [textFieldForLogin, textFieldForPassword]
        
        for view in viewsArr {
            self.view.addSubview(view)
        }
        
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { nc in
            self.view.frame.origin.y = -100
        }
   
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) {
            nc in
            self.view.frame.origin.y = 0 
        }
        
        
        
        
    }
     
    func createTFforLogin(view:UIViewController) {
        textFieldForLogin.frame = CGRect(x: 30, y: 90, width: 200, height: 34)
        textFieldForLogin.borderStyle = .roundedRect
        textFieldForLogin.placeholder = "login"
        textFieldForLogin.tintColor = .blue
        textFieldForLogin.delegate = self
        //Krestic
        textFieldForLogin.clearButtonMode = .whileEditing
    }
    
    func createTFforPass(view:UIViewController) {
        textFieldForPassword.frame = CGRect(x: 30, y: 160, width: 200, height: 34)
        textFieldForPassword.borderStyle = .roundedRect
        textFieldForPassword.placeholder = "Password"
        textFieldForPassword.tintColor = .blue
        textFieldForPassword.delegate = self
        //
        textFieldForPassword.clearButtonMode = .whileEditing
    }
    
    
    
    
    

    

}
