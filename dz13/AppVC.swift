//
//  AppVC.swift
//  dz13
//
//  Created by Parshkova Daria on 05.03.2023.
//

import UIKit

class AppVC: UIViewController {
    let textView = UITextView()
    let settingsTextView = UIView()
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        createSettingsTV()
        createTextView()
        createBarButton()
        notification()
        
        
        let arrForView = [settingsTextView, textView]
        for view in arrForView {
            self.view.addSubview(view)
        }
     
    }
    //Notificatiom
    func notification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.resignFirstResponder()
    }
    @objc func updateTextView(param:Notification) {
        let userInfo = param.userInfo
        let getKeyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardFrame = self.view.convert(getKeyboardRect, to: view.window)
        
        if param.name == UIResponder.keyboardWillShowNotification  {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
    func createBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: nil)
        
       
        
    }
    //
    func createTextView() {
        textView.frame = CGRect(x: 0, y: 75 + view.safeAreaInsets.top, width: self.view.bounds.width, height: self.view.bounds.height - 50)
        textView.backgroundColor = .lightGray
        textView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = "Hei i am Dari and i like programming. I'll graduate from university next yaear of way programming"
        textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    
    func createSettingsTV() {
        settingsTextView.frame = CGRect(x: 100, y: 100 + view.safeAreaInsets.top, width: self.view.bounds.width - 105, height: 220)
        settingsTextView.layer.cornerRadius = settingsTextView.frame.size.height / 8
        settingsTextView.backgroundColor = .yellow.withAlphaComponent(0.30)
        //settingsTextView.isHidden = true
    }
    
    
    
    
    
    
    
    
 
}





extension AppVC : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontsArr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontsArr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //textView.font = UIFont(name: fontsArr[row], size: self.textView.font?.pointSize)
        //textView.font = UIFont(name: fontsArr[row], size: CGFloat(s))
        textView.text = fontsArr[row]
        
    }
    
    
}
var fontsArr = ["Tahoma","Georgia","Arial","Zapfino"]
