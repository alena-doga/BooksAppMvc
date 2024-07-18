//
//  AppDelegate.swift
//  BooksAppMvc
//
//  Created by Alena on 13.07.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

          window = UIWindow(frame: UIScreen.main.bounds)

          let rootViewController = RootViewController()
          let navigationController = UINavigationController(rootViewController: rootViewController)
          window?.rootViewController = navigationController
          window?.makeKeyAndVisible()

          return true
      }
  }

