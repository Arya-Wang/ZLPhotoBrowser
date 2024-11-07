//
//  AppDelegate.swift
//  Example
//
//  Created by long on 2020/8/11.
//

// https://www.jianshu.com/p/5c566f32cfbf 更新仓库代码，并且和当前本地代码合并，并保留两边的修改
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let nav = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = nav
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

