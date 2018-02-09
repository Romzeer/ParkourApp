//
//  levelViewController.swift
//  Parkour
//
//  Created by Romzeer on 08/02/2018.
//  Copyright © 2018 Romzeeer. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    var difficulty: String = "Bois"
    
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var expertBtn: UIButton!
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var grisBtn: UIButton!
    @IBOutlet weak var amateurBtn: UIButton!
    @IBOutlet weak var boisBtn: UIButton!
    
    @IBAction func boisBtnTapped(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "tableView") as! ParkoursViewController
        myVC.difficulty = self.difficulty
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Debutant button
        boisBtn.layer.cornerRadius = 3
        boisBtn.layer.borderWidth = 1
        boisBtn.layer.borderColor = UIColor.brown.cgColor
        boisBtn.setTitleColor(UIColor.brown, for: .normal)
        boisBtn.backgroundColor = nil
        
        // Amateur btn
        amateurBtn.layer.cornerRadius = 3
        amateurBtn.layer.borderWidth = 1
        amateurBtn.layer.borderColor = UIColor.orange.cgColor
        amateurBtn.setTitleColor(UIColor.orange, for: .normal)
        amateurBtn.backgroundColor = nil
        
        // Intermidiaire btn
        grisBtn.layer.cornerRadius = 3
        grisBtn.layer.borderWidth = 1
        grisBtn.layer.borderColor = UIColor.gray.cgColor
        grisBtn.setTitleColor(UIColor.gray, for: .normal)
        grisBtn.backgroundColor = nil
        
        // Confirmé btn
        redBtn.layer.cornerRadius = 3
        redBtn.layer.borderWidth = 1
        redBtn.layer.borderColor = UIColor.red.cgColor
        redBtn.setTitleColor(UIColor.red, for: .normal)
        redBtn.backgroundColor = nil
        
        // Expériementé btn
        expertBtn.layer.cornerRadius = 3
        expertBtn.layer.borderWidth = 1
        expertBtn.layer.borderColor = UIColor.yellow.cgColor
        expertBtn.setTitleColor(UIColor.yellow, for: .normal)
        expertBtn.backgroundColor = nil
        
        // Professionnel btn
        blackBtn.layer.cornerRadius = 3
        blackBtn.layer.borderWidth = 1
        blackBtn.layer.borderColor = UIColor.black.cgColor
        blackBtn.setTitleColor(UIColor.black, for: .normal)
        blackBtn.backgroundColor = nil
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

