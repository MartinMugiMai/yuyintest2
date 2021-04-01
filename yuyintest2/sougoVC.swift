//
//  sougoVC.swift
//  yuyintest2
//
//  Created by 麦俊杰 on 2021/2/16.
//

import UIKit
import Flutter

class sougoVC: UIViewController {
//    var flutterEngine: FlutterEngine = FlutterEngine()
//    var flutterViewController: FlutterViewController = FlutterViewController()
    
    @IBOutlet weak var recordButtonL: UIButton!
    
    @IBOutlet weak var textview1: UITextView!
    
    @IBAction func recButton(_ sender: Any) {
        print("按下录音")
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        GeneratedPluginRegistrant.register(with: flutterViewController.pluginRegistry())
        present(flutterViewController, animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        //flutterViewController = FlutterViewController(engine: self.flutterEngine, nibName: nil, bundle: nil)
        //GeneratedPluginRegistrant.register(with: flutterViewController.pluginRegistry())
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
