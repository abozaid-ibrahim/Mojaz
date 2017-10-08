//
//  TabBarViewController.swift
//  Mojaz
//
//  Created by abuzeid on 9/26/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        

        navigationItem.titleView?.backgroundColor = UIColor.mainColor
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style:.plain, target: self, action: #selector(toggleMenu(sender:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "chat_2").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(notifAction(sender:)))


    }
    func notifAction(sender:Any){}

    func toggleMenu(sender:Any){
        
        if self.sideMenuViewController.isBeingPresented{
        self.sideMenuViewController.dismiss(animated: true, completion: nil)
        }else{
        self.sideMenuViewController.presentLeftMenuViewController()
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
