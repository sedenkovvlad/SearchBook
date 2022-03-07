//
//  AppDelegate.swift
//  SearchBook
//
//  Created by Владислав Седенков on 07.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: SearchViewController())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
}

