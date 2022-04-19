//
//  Manager.swift
//  Day2Lab1 PersonSalary
//
//  Created by Karam Ibrahim on 4/17/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

class Manager : Person{
    var sal = 0
    override var salary: Int {
        get {return sal}
        set{ sal = newValue*2 }
    }
       
}
