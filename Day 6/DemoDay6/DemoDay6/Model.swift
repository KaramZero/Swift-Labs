//
//  Model.swift
//  DemoDay6
//
//  Created by Iti on 4/21/22.
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
    
    enum CodingKeys : String , CodingKey{
        case id = "id"
        case rank = "rank"
        case header = "title"
        case image = "image"
        case weekend = "weekend"
        case gross = "gross"
        case weeks = "weeks"
        // to the end
    }
}

class MyResult : Decodable {
    var items : [Item]
    var errorMessage : String?
}

func fetchResult(complitionHandler: @escaping (MyResult?) -> Void ){
    
    // 1-
           let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_uw09j68u")
           guard let newURL = url else{
               print("Error while unwrapping URL")
               return
           }
           // 2-
           let request = URLRequest(url: newURL)
           // 3-
           let session = URLSession(configuration: .default)
           
           let task = session.dataTask(with: request) { (data, response, error) in
               // todo
               guard let data = data else{
                   return
               }
               do{
                   
                   /*
                   let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                   print(result)
                   // title of first movie
                   let items = result["items"] as! [Dictionary<String, String>]
                   let firstObject = items[0]
                   //let firstObject = items.first
                   let title = firstObject["title"]
                   
                   print("title: \(title ?? "")")
    */
                   
                   let result = try JSONDecoder().decode(MyResult.self, from: data)
                complitionHandler(result)
                //return result // wrong
                
                   
               }catch let error{
                   print(error.localizedDescription)
                    complitionHandler(nil)
               }
           }
           task.resume()
           

}
