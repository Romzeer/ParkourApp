//
//  CustomTableViewCell.swift
//  Parkour
//
//  Created by Romzeer on 08/02/2018.
//  Copyright © 2018 Romzeeer. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var parkourImageView: UIImageView!
    
    @IBOutlet weak var metroLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    //create a URL Session, this time a shared one since its a simple app
    let session = URLSession.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
  
    
    func populate(parkour: Parkour) {
        
        // Displaying data, part two
        nameLabel.text = parkour.name
       
        metroLabel.text = parkour.metro
      
        let imageUrl = URL(string: parkour.image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUrl!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.parkourImageView.image = UIImage(data: data!)
            }
        }
       
        
        
    }
    

 

}
