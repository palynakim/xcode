//
//  EventcollegtionViewController.swift
//  Test2
//
//  Created by CKCC-IMac13 on 3/26/18.
//  Copyright © 2018 Phally. All rights reserved.
//

import UIKit

class EventcollegtionViewController: UIViewController, UICollectionViewDataSource{

    @IBOutlet weak var eventcollegtionview: UICollectionView!
    let eventsTitle = ["CKCC Cultur Day","CKCC Cultur Day", "CKCC Cultur Day", "CKCC Cultur Day" ]
    let eventsDate = ["01-April-2018", "01-April-2018", "01-April-2018","01-April-2018"]
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //
        let File = UINib(nibName: "eventcollectoinview", bundle: nil)
        eventcollegtionview.register(File, forCellWithReuseIdentifier: "event_cells")
        eventcollegtionview.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsTitle.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "event_cells", for: indexPath) as! EventCollectionViewCell
      cells.eventtitle.text = eventsTitle[indexPath.row]
       cells.eventdate.text = eventsDate[indexPath.row]
      
        
        return cells
    }

}
