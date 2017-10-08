//
//  SideMenuViewController.swift
//  Mojaz
//
//  Created by abuzeid on 9/25/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//
//

import UIKit
import Kingfisher
class SideMenuViewController: BaseViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var dataSource :[MenuItem] = [MenuItem]()
    fileprivate let cellIdentifier = "SideMenuTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(SideMenuTableCell.self, forCellReuseIdentifier: cellIdentifier)
        setDataSource()
  
        tableView.reloadData()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setDataSource(){
        dataSource.removeAll()
         // if app.isUserLoggedIn(){
            
            dataSource.append(MenuItem(title: s.id.home, icon: #imageLiteral(resourceName: "first") ,task: .none ,vc:Cuts.vc(storyid: cids.tabBarViewController)))
            dataSource.append(MenuItem(title: s.id.choose_country,icon:#imageLiteral(resourceName: "first")  , task: .none ,vc:RootViewController()))
         //   }
        
        dataSource.append(MenuItem(title: s.id.shareApp, icon:#imageLiteral(resourceName: "first") ,task: .share ,vc:self))
      
        
    }
   
    
    func updateSideMene(){
        setDataSource()
        tableView.reloadData()
        
    }
    
    
    
}


extension SideMenuViewController:UITableViewDataSource,UITableViewDelegate{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if app.isUserLoggedIn() {
            return CGFloat(self.view.frame.size.height / 3.8 )
        }else{
            return CGFloat(self.view.frame.size.height / 5 )
        }
    }
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        let headerView = Bundle.main.loadNibNamed("sidemenu_header_no_user", owner: self, options: nil)?.first as? UIView as! sidemenu_header_no_user?
        if app.isUserLoggedIn() {
            
//            let gest = UITapGestureRecognizer(target: self, action: #selector(showOptions(sender:)))
//            headerView!.addGestureRecognizer(gest)
            
        }
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SideMenuTableCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SideMenuTableCell
               cell.selectionStyle = .none
            //
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        
        if dataSource[indexPath.row].task == task.none {
            if  let vc = dataSource[indexPath.row].vc{
            }
            
        }else{
            if  let todo = dataSource[indexPath.row].task{
                
                switch todo {
                case .share:
                    Utils.share(vc: self, objectsToShare: [app.getAppShareLink()])
                    
                    break;
                case .logout:
                    break;
                default:
                    print("nothing to do herere....")
                    break;
                    
                }
            }
            
            
        }
        
        
        
        
    //close menu
    
    }
    
    
}
