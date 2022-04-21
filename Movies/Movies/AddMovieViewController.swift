//
//  AddMovieViewController.swift
//  Movies
//
//  Created by Karam Ibrahim on 4/20/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    var myTableVC : AddMovieProtocal?
    var movie :Movie?
   
    @IBOutlet var textFieldReleseYear: UITextField!
    @IBOutlet var textFieldGenre: UITextField!
    @IBOutlet var textFieldRating: UITextField!
    @IBOutlet var textFieldTitle: UITextField!
    @IBOutlet var imageMovie: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movie = Movie()

    }
    
    @IBAction func btnChooseImage(_ sender: UIButton) {
        let myPicker = UIImagePickerController()
        myPicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            myPicker.sourceType = .camera
            self.present(myPicker, animated: true, completion: nil)
        }else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            myPicker.sourceType = .photoLibrary
            myPicker.allowsEditing = true
            self.present(myPicker, animated: true, completion: nil)
            
        }else{
            print("Sorry!")
        }
       }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageMovie.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
             let image : UIImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
               let imageData:NSData = image.pngData()! as NSData
               let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
            movie?.image = strBase64
        picker.dismiss(animated: true, completion: nil)
        
    }
    

    
    @IBAction func btnSubmit(_ sender: UIButton) {
        movie?.title = textFieldTitle.text ?? ""
        movie?.rating = Float(textFieldRating.text ?? "0.0")!
        movie?.genre = [textFieldGenre.text ?? ""]
        movie?.releseYear = Int(textFieldReleseYear.text ?? "1")!
        
        myTableVC?.addMovie(movie: movie!)
        navigationController?.popViewController(animated: true)
        
       }
}
