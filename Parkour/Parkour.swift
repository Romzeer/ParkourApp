//
//  Parkour.swift
//  Parkour
//
//  Created by Romzeer on 08/02/2018.
//  Copyright © 2018 Romzeeer. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}

struct Parkour {
    
    var metro: String
    var name: String
    var lieu: String
    var difficulte: String
    var wr: String
    var image: String

    
    var dictionary: [String: Any] {
        return [
            "Metro": metro,
            "Nom": name,
            "Lieu": lieu,
            "Difficulté": difficulte,
            "WR": wr,
            "image": image
        ]
    }
    
}

extension Parkour: DocumentSerializable {
    

    
    init?(dictionary: [String : Any]) {
        guard let metro = dictionary["Metro"] as? String,
              let name = dictionary["Nom"] as? String,
              let lieu = dictionary["Lieu"] as? String,
              let difficulte = dictionary["Difficulté"] as? String,
              let wr = dictionary["WR"] as? String,
              let image = dictionary["image"] as? String
        else {
                return nil
        }
            
        
        self.init(metro: metro,
                  name: name,
                  lieu: lieu,
                  difficulte: difficulte,
                  wr: wr,
                  image: image
        )
    }
    
}
