//
//  EventViewController.swift
//  Test2
//
//  Created by CKCC-IMac13 on 3/21/18.
//  Copyright © 2018 Phally. All rights reserved.
//

import UIKit

class EventViewController: UIViewController , UITableViewDataSource{

    
    @IBOutlet weak var eventtableview: UITableView!
    let events = ["event 1", "Event 2"]
    override func viewDidLoad() {
        super.viewDidLoad()
        eventtableview.dataSource=self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell_view")!
        Cell.textLabel?.text=events[indexPath.row]
        return Cell
    }

}
