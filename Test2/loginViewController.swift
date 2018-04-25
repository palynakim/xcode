//
//  loginViewController.swift
//  Test2
//
//  Created by CKCC-IMac13 on 4/23/18.
//  Copyright © 2018 Phally. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var UsernameTextfile: UITextField!
    @IBOutlet weak var PasswordTextfile: UITextField!
    @IBOutlet weak var loadomAcyivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loginbutton: UIButton!
    
    @IBAction func onloginByttonclick(_ sender: Any) {
        // show longin and show login
        loginbutton.isHidden = true
        loadomAcyivityIndicator.isHidden = false
        let username = UsernameTextfile.text!
        let password = PasswordTextfile.text!
        
        // Create paramatera to submit
        let params = "username=\(username)&password=\(password)"
        
        // submit data to server
       // let loginUrl = URL(string: "http://localhost/test/ckcc-api/login.php")!
         let loginUrl = URL(string: "http://test.js-cambodia.com/ckcc/login.php")!
        var loginRequest = URLRequest(url: loginUrl)
        loginRequest.httpMethod = "POST"
        loginRequest.httpBody = params.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: loginRequest) { (data, response , errno) in
            let jsonDecoder = JSONDecoder()
            let loginResponses = try? jsonDecoder.decode(LoginRespone.self, from: data!)
            if loginResponses?.code == 0{
                DispatchQueue.main.async {
                    // Move user to mome view conroller
                    self.performSegue(withIdentifier: "segue_home", sender: nil)
                }
            } else {
                DispatchQueue.main.async {
                    // Hide loading and show login buttton
                    self.loadomAcyivityIndicator.isHidden = true
                    self.loginbutton.isHidden = false
                    self.showloginErrorMessage(loginResponses!.message)
                    
                    
                }
                
            }
    
        }
        task.resume()
    
        
    }
    func showloginErrorMessage (_ message: String){
        let alertController = UIAlertController(title: "Login Fail", message: message,preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion:  nil)
    }
    

}
