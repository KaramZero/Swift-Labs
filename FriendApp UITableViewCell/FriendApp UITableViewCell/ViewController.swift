//
//  ViewController.swift
//  FriendApp UITableViewCell
//
//  Created by Karam Ibrahim on 4/19/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
  

    @IBOutlet var myTable: UITableView!
    var friends :[Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myTable.delegate = self
        self.myTable.dataSource = self
        
        let f1 = Friend()
        f1.name = "Karam"
        f1.age = 26
        friends.append(f1)
        
        let f2 = Friend()
        f2.name = "Eslam"
        f2.age = 26
        friends.append(f2)
        
    }
   func numberOfSections(in tableView: UITableView) -> Int {
           
           return 1
       }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell

            let friend :Friend = (self.friends[indexPath.row])
        cell.nameLBL.text = friend.name
        cell.ageLBL.text = String(friend.age)
        cell.imageV.image = UIImage(named: "frnd.png")

                return cell
      }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           //return 100
          return UIScreen.main.bounds.size.height/10
       }
}

