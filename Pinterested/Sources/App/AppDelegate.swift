//
//  AppDelegate.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit
import Hero
import Cache

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CacheManager.shared.countLimit = 100
        navigateToRootVC()
        setNavBarUI()
        
        return true
    }
    
    /// Setting Navigation Bar UI
    private func setNavBarUI() {
        UINavigationBar.appearance().barStyle = .default
        UINavigationBar.appearance().barTintColor = UIColor.primaryColor
        UINavigationBar.appearance().tintColor = UIColor.secondaryColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.secondaryColor]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    /// Navigation handler for startup
    private func navigateToRootVC() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let pinboardScene = SceneFactory.shared().getScene(sceneType: .Pinboard)
        let navController = UINavigationController(rootViewController: pinboardScene)
        navController.hero.isEnabled = true
        window?.rootViewController = navController
    }
    
}
