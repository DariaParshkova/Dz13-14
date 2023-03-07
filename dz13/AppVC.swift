//
//  AppVC.swift
//  dz13
//
//  Created by Parshkova Daria on 05.03.2023.
//

import UIKit

class AppVC: UIViewController {
    //var enterLog = UIButton(type: .system)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        /*
        let viewsArr = [enterLog]
        for view in viewsArr {
            self.view.addSubview(view)
        }*/
    }
    /*
    func createEnterLog(view:UIView) {
        enterLog.setTitle("Enter", for: .normal)
        enterLog.setTitleColor(.blue, for: .normal)
        enterLog.frame = CGRect(x: 40, y: 100, width: 70, height: 35)
        enterLog.addTarget(self, action: #selector(enterLogVc(param:)), for: .touchUpInside)
    }
    @objc func enterLogVc(param:Any) {
        let appVc = AppVC()
        self.navigationController?.pushViewController(appVc, animated: true)
    }
*/
}
