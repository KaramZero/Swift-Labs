//
//  Model.swift
//  lab7_q2
//
//  Created by Karam Ibrahim on 4/23/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
class Item : Decodable{
    var id : String?
    var rank : String?
    var title : String?
    var image : String?
    var weekend : String?
    var gross : String?
    var weeks : String?
    
}

class MyResult : Decodable {
    var items : [Item]
    var errorMessage : String?
}
