//
//  AddMovie.swift
//  lab2_q2
//
//  Created by Karam Ibrahim on 4/23/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import CoreData

class AddMovie: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var chooseimg: UIImageView!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var ratingTF: UITextField!
    @IBOutlet weak var genreTF: UITextField!
    var imgPath : NSData?
       var firstVC : AddProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveImg(_ sender: UIButton) {
        let myImgPicker = UIImagePickerController()
                  myImgPicker.delegate = self
                  
                  if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                      myImgPicker.sourceType = .photoLibrary
                      myImgPicker.allowsEditing = true
                      self.present(myImgPicker, animated: true, completion: nil)
                  }else{
                      print("Sorry Can't Open The Gallery")
                  }
    }
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         chooseimg.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                picker.dismiss(animated: true, completion: nil)
      let imageData: NSData = chooseimg.image!.pngData() as! NSData
        imgPath = imageData
        //print(strimg)
     }
    @IBAction func save(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
                  let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context)
        let newMovie = NSManagedObject(entity: entity!, insertInto: context)
        let enteredTitle = titleTF.text ?? "" as String
        let enteredYear = Int16(yearTF.text!)
        let enteredRating = (ratingTF.text! as NSString).doubleValue
        let enteredGenre = genreTF.text ?? "" as String
        newMovie.setValue(enteredTitle, forKey: "title")
        newMovie.setValue(enteredRating, forKey: "rating")
        newMovie.setValue(enteredYear, forKey: "releaseYear")
        newMovie.setValue(enteredGenre, forKey: "genre")
        newMovie.setValue( imgPath, forKey: "image")
        firstVC?.getMovie(movie: newMovie as! Movie)
        self.navigationController?.popViewController(animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
