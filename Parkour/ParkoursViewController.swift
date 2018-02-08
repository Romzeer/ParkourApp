//
//  ParkoursTableViewController.swift
//  Parkour
//
//  Created by Romzeer on 08/02/2018.
//  Copyright © 2018 Romzeeer. All rights reserved.
//

import Foundation
import Firebase

class ParkoursViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet weak var tableView: UITableView!
    

    
    private var parkours: [Parkour] = []
    private var parkour: Parkour?
    var db = Firestore.firestore()


    
    private var listener: ListenerRegistration?
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()

      
    }
    override func viewWillAppear(_ animated: Bool) {
        db.collection("parkours").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
            
                let models = querySnapshot?.documents.map { (document) -> Parkour in
                    print(document.data())
                    
                    if let model = Parkour.init(dictionary: document.data()) {
                        print(model)
                        return model
                    } else {
                        // Don't use fatalError here in a real app.
                        fatalError("Unable to initialize type \(Parkour.self) with dictionary \(document.data())")
                    }
                }
                
                self.parkours = models!
                self.tableView.reloadData()
            }
        }
    }
    
   


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let parkour = parkours[indexPath.row]
        cell.populate(parkour: parkour)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkours.count
    }
}

