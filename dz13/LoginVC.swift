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
    let enterButton = UIButton()
    let registratinButton = UIButton()
    
    let flexibleSpace = UIBarButtonItem()
    let doneButton = UIBarButtonItem()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTFforLogin(view: self)
        createTFforPass(view: self)
        createToolBar(view: self)
        createEnterButton(view: self)
        createRegButton(view: self)
        hideKeyBoardWhenTapped()
        notifacationCenter()
        let viewsArr = [textFieldForLogin, textFieldForPassword, enterButton, registratinButton]
        
        for view in viewsArr {
            self.view.addSubview(view)
        }
        

       
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
        textFieldForLogin.clearButtonMode = .whileEditing
        textFieldForLogin.inputAccessoryView = toolBar
    }
    
    func createTFforPass(view:UIViewController) {
        //textFieldForPassword.frame = CGRect(x: 30, y: 160, width: 200, height: 34)
        textFieldForPassword.borderStyle = .roundedRect
        textFieldForPassword.placeholder = "Password"
        textFieldForPassword.tintColor = .blue
        textFieldForPassword.delegate = self
        textFieldForPassword.clearButtonMode = .whileEditing
        textFieldForPassword.inputAccessoryView = toolBar
    }
    
    func createEnterButton(view:UIViewController) {
        enterButton.frame = CGRect(x: 120, y: 310, width: 100, height: 40)
        enterButton.setTitle("Enter", for: .normal)
        enterButton.tintColor = .blue
        enterButton.backgroundColor = .lightGray
        enterButton.layer.cornerRadius = 3
        enterButton.addTarget(self, action: #selector(enterBtnTapped), for: .touchUpInside)
        //enterButton.addTarget(self, action: #selector(enterBtnTapped), for: .touchUpInside)
        
    }
    
    @objc func enterBtnTapped() {
        let appVc = AppVC()
        self.navigationController?.pushViewController(appVc, animated: true)
    }
    
    
    func createRegButton(view:UIViewController) {
        registratinButton.frame = CGRect(x: 120, y: 270, width: 100, height: 30)
        registratinButton.setTitle("Registration", for: .normal)
        registratinButton.setTitleColor(.blue, for: .normal)
        registratinButton.addTarget(self, action: #selector(regScreen(param:)), for: .touchUpInside)
    }
    @objc func regScreen(param:Any) {
        let regVC = RegestrationVC()
        self.navigationController?.pushViewController(regVC, animated: true)
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
    //перескакиваем на след поле и убираем клавиатуру при нажатии на enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldForLogin {
            textFieldForPassword.becomeFirstResponder()
        } else if textField == textFieldForPassword {
            textFieldForPassword.resignFirstResponder()
        }
        return true
    }
    

    

}

