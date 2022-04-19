//
//  ViewController.swift
//  Day2Lab1 PersonSalary
//
//  Created by Karam Ibrahim on 4/17/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var outputSalary: UILabel!
    @IBOutlet weak var inputSalary: UITextField!
    @IBAction func empBTN(_ sender: UIButton) {
        var emp = Emp()
        emp.salary = Int(inputSalary.text!) ?? 0
        outputSalary.text = String(emp.salary)
    }
    @IBAction func managerBTN(_ sender: UIButton) {
        var man = Manager();
        man.salary = (Int(inputSalary.text!) ?? 0)
        outputSalary.text = String (man.salary)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

