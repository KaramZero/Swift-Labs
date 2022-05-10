//
//  Model.swift
//  Day6Demo
//
//  Created by Iti on 1/13/22.
//  Copyright © 2022 jets. All rights reserved.
//

import Foundation

class Item : Decodable{
    var id : String?
    var rank : String?
    var header : String?
    var image : String?
    var weekend : String?
    var gross : String?
    var weeks : String?
//    enum CodingKeys : String, CodingKey{
//
//        //case titl = "title"
//        case header = "title"
//    }
}
