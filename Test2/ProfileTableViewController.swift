//
//  ProfileTableViewController.swift
//  Test2
//
//  Created by CKCC-IMac13 on 3/28/18.
//  Copyright © 2018 Phally. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    @IBOutlet weak var ProfileImageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //change image view to circle
        ProfileImageview.layer.masksToBounds = true
        ProfileImageview.layer.cornerRadius = 35
        
    
    // load steve.jpg as data
    let imageUrl = URL(string: "http://test.js-cambodia.com/ckcc/image/steve.jpg")!
   
        let tast = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            // conver to image
            if data == nil {
                
            } else{
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.ProfileImageview.image = image
                }
                
            }
        
        }
            tast.resume()
        
       
        
    }
    
    
}

