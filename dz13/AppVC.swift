//
//  AppVC.swift
//  dz13
//
//  Created by Parshkova Daria on 05.03.2023.
//

import UIKit

class AppVC: UIViewController {
    let textView = UITextView()
    let settingsViews = UIView()
    let (blackButton, blueButton, brownButton, whiteButton) = (UIButton(), UIButton(), UIButton(), UIButton())
    let picker = UIPickerView()
    let slider = UISlider()
    let modeSwitch = UISwitch()
    //let settingsTextView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        createTextView()
        createSettingsView()
        //createSettingsTV()
        createBarButton()
        notification()
        createColorButtons()
        createPickerView()
        createSlider()
        createSwitch()
      
        let arrForView = [ textView, settingsViews]
        for view in arrForView {
            self.view.addSubview(view)
        }
        
    
     
    }
    func createSettingsView() {
        
        settingsViews.frame = CGRect(x: 100, y: 100 + view.safeAreaInsets.top, width: self.view.bounds.width - 105, height: 220)
        settingsViews.layer.cornerRadius = settingsViews.frame.size.height / 8
        settingsViews.backgroundColor = .yellow.withAlphaComponent(0.40)
        settingsViews.isHidden = true
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target:self, action:#selector(openedTheSettinds))
                                
    }
        @objc func openedTheSettinds() {
            if settingsViews.isHidden {
                settingsViews.isHidden = false
            } else {
                settingsViews.isHidden = true
            }
        }
        
    //
    func createTextView() {
        textView.frame = CGRect(x: 0, y: 75 + view.safeAreaInsets.top, width: self.view.bounds.width, height: self.view.bounds.height - 50)
        //textView.backgroundColor = .lightGray
        textView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = "Hei i am Dari and i like programming. I'll graduate from university next yaear of way programming"
        textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func createColorButtons() {
        let buttonsArr = [blackButton, blueButton, brownButton, whiteButton]
        var startX = 20
        blackButton.backgroundColor = .black
        blueButton.backgroundColor = .blue
        brownButton.backgroundColor = .brown
        whiteButton.backgroundColor = .white
        
        for oneButton in buttonsArr {
            oneButton.frame = CGRect(x: startX, y: 20, width: 40, height: 40)
            //сдвиг след кнопки по оси x
            startX += 44
            oneButton.layer.cornerRadius = 10
            settingsViews.addSubview(oneButton)
            oneButton.addTarget(self, action: #selector(changeTextColor(button: )), for:.touchUpInside)
        }
    }
    @objc func changeTextColor(button:UIButton) {
        textView.textColor = button.backgroundColor
    }
    func createPickerView() {
        picker.frame = CGRect(x: 20, y: 90, width: 150, height: 120)
        picker.dataSource = self
        picker.delegate = self
        settingsViews.addSubview(picker)
    }
    func createSlider() {
        slider.frame = CGRect(x:20, y:70 , width: 100, height: 30)
        slider.minimumValue = 12
        slider.maximumValue = 35
        slider.value = 20
        textView.font = textView.font?.withSize(CGFloat(slider.value))
        slider.addTarget(self, action:#selector(changeFontSize), for: .valueChanged)
        settingsViews.addSubview(slider)
    }
    @objc func changeFontSize() {
        textView.font = textView.font?.withSize(CGFloat(slider.value))
    }
    
    func createSwitch() {
        modeSwitch.frame = CGRect(x: 210, y: 20, width: 49, height: 30)
        modeSwitch.isOn = false
        settingsViews.addSubview(modeSwitch)
        modeSwitch.addTarget(self, action: #selector(modeBackground), for: .valueChanged)
    }
    
    @objc func modeBackground() {
        if modeSwitch.isOn {
            self.view.backgroundColor = .black
            textView.backgroundColor = .black
            textView.textColor = .white
        } else {
            self.view.backgroundColor = .white
            textView.backgroundColor = .white
            textView.textColor = .black
        }
        
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
        textView.font = UIFont(name: fontsArr[row], size: self.textView.font?.pointSize ?? CGFloat(slider.value))
    }
    
    
}
var fontsArr = ["Tahoma","Georgia","Zapfino"]



