//
//  AppDelegate.swift
//  yuyintest2
//
//  Created by 麦俊杰 on 2021/2/7.
//

import UIKit
import Flutter
import FlutterPluginRegistrant
let kOverlayStyleUpdateNotificationName = "io.flutter.plugin.platform.SystemChromeOverlayNotificationName"
let kOverlayStyleUpdateNotificationKey = "io.flutter.plugin.platform.SystemChromeOverlayNotificationKey"
@main
class AppDelegate: FlutterAppDelegate {
    
    lazy var flutterEngine = FlutterEngine(name: "jmygflu")


    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: self )
       // GeneratedPluginRegistrant.register(with: FlutterViewController.pluginRegistry())
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    override func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    override func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

//extension FlutterViewController {
//    private struct StatusBarStyleHolder {
//        static var style: UIStatusBarStyle = .default
//    }
//
//    open override func viewDidLoad() {
//        super.viewDidLoad()
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(appStatusBar(notification:)),
//            name: NSNotification.Name(kOverlayStyleUpdateNotificationName),
//            object: nil
//        )
//    }
//
//    open override var preferredStatusBarStyle: UIStatusBarStyle {
//        return StatusBarStyleHolder.style
//    }
//
//    @objc private func appStatusBar(notification: NSNotification) {
//        guard
//            let info = notification.userInfo as? Dictionary<String, Any>,
//            let statusBarStyleKey = info[kOverlayStyleUpdateNotificationKey] as? Int
//        else {
//            return
//        }
//
//        if #available(iOS 13.0, *) {
//            StatusBarStyleHolder.style = statusBarStyleKey == 1 ? .darkContent : .lightContent
//        } else {
//            StatusBarStyleHolder.style = statusBarStyleKey == 1 ? .default : .lightContent
//        }
//
//        setNeedsStatusBarAppearanceUpdate()
//    }
//}
//
