//
//  eventViewController.swift
//  Test2
//
//  Created by CKCC-IMac13 on 3/21/18.
//  Copyright © 2018 Phally. All rights reserved.
//

import UIKit

class eventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let events = ["Event 1","Event 2","Event 3"]
    let eventdate = ["March 1 2018","March 2 2018","March 3 2018"]
    var Events = [Event]()
    @IBOutlet weak var eventtableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let cellfile = UINib(nibName: "eventtableviewcell", bundle: nil)
        // regiser .xib to table view
      
        eventtableview.register(cellfile, forCellReuseIdentifier:"Cell_event")
        eventtableview.dataSource = self
        eventtableview.delegate = self
        // assign data source = sell

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_event") as! EvenTableViewCell
      // let eevent = Events[indexPath.row]
        cell.imgtableviewcell.image = #imageLiteral(resourceName: "full-logo")
        cell.lableviewcell.text = "This is RUPP"
        // load event image from server
       // if let imageUrl = URL (String: eventtableview.image){
            
       // }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Eventtableview", sender: nil)
    }
    
   
}
