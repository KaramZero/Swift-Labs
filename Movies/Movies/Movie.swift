//
//  Movie.swift
//  Movies
//
//  Created by ayahassan on 4/17/22.
//  Copyright © 2022 ayahassan. All rights reserved.
//

import Foundation

class Movie{
    
    var title = "No Movie"
    var image :String = ""
    var rating :Float = 0.0
    var releseYear :Int = 0
    var genre :[String] = ["Action","Drama"]
    
    subscript(index : Int) -> String{
        get{
            return genre[index]
        }
        set(newValue){
            genre[index] = newValue
        }
    }
    
}
