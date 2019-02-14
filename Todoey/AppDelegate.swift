//
//  AppDelegate.swift
//  Todoey
//
//  Created by James Ogila on 16/01/2019.
//  Copyright © 2019 James Ogila. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
//        Cause we are not unwrapping it will b printed as an optional to find where file is
        
        do {
            _ = try Realm()
            } catch {
            print("Error initialising new realm, \(error)")
        }
        
        return true
    }
    
}

