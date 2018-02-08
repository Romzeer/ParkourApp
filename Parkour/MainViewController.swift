//
//  MainViewController.swift
//  Parkour
//
//  Created by Romzeer on 06/02/2018.
//  Copyright © 2018 Romzeeer. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit






class MainViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var WelcomeTitle: UILabel!
    
    
    var db = Firestore.firestore()

    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let colors = Colors()
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer?.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.setTitleDisplay(user)
        }
  
        
    }
    
    
    func setTitleDisplay(_ user: User?) {
        if let name = user?.displayName {
            self.navigationItem.title = "Accueil"
            WelcomeTitle.text = "Bonjour \(name)"
        } else {
            self.navigationItem.title = "Authentication Example"
        }
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        //Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
