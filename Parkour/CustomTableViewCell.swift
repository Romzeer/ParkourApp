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
    @IBOutlet weak var wrLabel: UILabel!
    @IBOutlet weak var metroLabel: UILabel!
    @IBOutlet weak var lvlLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(parkour: Parkour) {
        
        // Displaying data, part two
        nameLabel.text = parkour.name
        lvlLabel.text = parkour.difficulte
        metroLabel.text = parkour.metro
        wrLabel.text = parkour.wr
        
    }

 

}
