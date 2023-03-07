//
//  UtilityFunc.swift
//  dz13
//
//  Created by Parshkova Daria on 03.03.2023.
//

import Foundation
import UIKit

class UtilityFunction : NSObject {
    func simpleAlert(vc: UIViewController, title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        vc.present(alert, animated: true, completion: nil)
    }
    func showSimpleAlert(vc: UIViewController, title:String,message:String, handler: @escaping (_
        action:UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
            handler(action)
        }
        alert.addAction(okAction)
        vc.present(alert, animated: true, completion:nil)
    }
                                                                        
}
