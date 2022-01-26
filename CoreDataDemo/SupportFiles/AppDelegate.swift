//
//  AppDelegate.swift
//  CoreDataDemo
//
//  Created by brubru on 24.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: TaskListViewController())
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        /*
         сохранение контекста при закрытии приложения,
         в том числе и при аварийном закрытии приложения
         */
        StorageManager.shared.saveContext()
    }


    

    

}

