//
//  CollectionViewController.swift
//  CollectionView Lab
//
//  Created by Karam Ibrahim on 4/19/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import SDWebImage


private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 50
                layout.minimumInteritemSpacing = 200
                layout.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 0, right: 50)
            let size = CGSize(width:(collectionView!.bounds.width)/2, height: 250)
                layout.itemSize = size
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
     //   self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        switch indexPath.item {
            case 0:
                        cell.myImage.sd_setImage(with: URL(string:  "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png"), placeholderImage: UIImage(named: "placeholder.png"))
            case 1:
                       cell.myImage.sd_setImage(with: URL(string: "https://leisure.union.ufl.edu/Content/Images/leisure-courses.png"), placeholderImage: UIImage(named: "placeholder.png"))
            case 2:
                       cell.myImage.sd_setImage(with: URL(string: "https://cdn2.iconfinder.com/data/icons/new-year-resolutions/64/resolutions-06-512.png"), placeholderImage: UIImage(named: "placeholder.png"))
            case 3:
                       cell.myImage.sd_setImage(with: URL(string: "https://pngimage.net/wp-content/uploads/2018/05/courses-png.png"), placeholderImage: UIImage(named: "placeholder.png"))
            case 4:
                       cell.myImage.sd_setImage(with: URL(string: "https://www.pngitem.com/pimgs/m/49-491826_of-course-developing-your-employee-engagement-offering-business.png"), placeholderImage: UIImage(named: "placeholder.png"))
            case 5:
                       cell.myImage.sd_setImage(with: URL(string: "https://feedbacksystems.com/wp-content/uploads/2019/12/Business.png"), placeholderImage: UIImage(named: "cars.png"))

        default:
            break
        }
        
      
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
