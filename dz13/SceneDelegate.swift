//
//  SceneDelegate.swift
//  dz13
//
//  Created by Parshkova Daria on 01.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else {return}
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let loginVc = LoginVC()
            let navController = UINavigationController(rootViewController: loginVc)
            
            self.window = window
            window.backgroundColor = UIColor.white
            window.rootViewController = navController
            window.makeKeyAndVisible()
            
            
            
            
        }
        
       
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
   
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}

extension UIViewController {
    func hideKeyBoardWhenTapped() {
        _ = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
    }
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
}



