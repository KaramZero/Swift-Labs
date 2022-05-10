//
//  NetworkManager.swift
//  MVVM
//
//  Created by Karam Ibrahim on 5/9/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

class NetworkManager{
    static var networkManagerInstance = NetworkManager()
    
     let url = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_hs8g0y00")
    
    
    private init(){
        
    }
    
    func getAllMovies(handler: @escaping (JsonResponse?) -> Void){
              
        
        guard let newUrl = url else{
            print("Ops!!.. Something went wrong (URL)")
            return
        }
        
        
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        
        print("Url : \(newUrl)")
        print("Request : \(request)")
        print("Session : \(session)")
        
        let task = session.dataTask(with: request){ (data, response, error) in
            guard let data = data else {
                print("Ops!!.. Something went wrong (Data)")
                return
            }
            
            print("Task")
            do{
                print("Do")
                let result = try JSONDecoder().decode(JsonResponse.self, from: data)
                print("Data : \(result.items)")
                handler(result)
            }catch let error{
                print("Error : \(error.localizedDescription)")
                handler(nil)
            }
        }
        task.resume()
    }
}
