//
//  AppDelegate.swift
//  FirebaseTestProj
//
//  Created by Alisher Tulembekov on 02.05.2024.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      FirebaseApp.configure()
      window = UIWindow()
      window?.rootViewController = UINavigationController(rootViewController: ViewController())
      window?.makeKeyAndVisible()

    return true
  }
}
