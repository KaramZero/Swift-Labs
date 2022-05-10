//
//  NetworkService.swift
//  Day6Demo
//
//  Created by Iti on 1/27/22.
//  Copyright © 2022 jets. All rights reserved.
//

import Foundation

protocol MovieService{
  static func fetchResult(complitionHandler : @escaping (MyResult?) -> Void)
}
class NetworkService : MovieService{
    

static func fetchResult(complitionHandler : @escaping (MyResult?) -> Void){
    let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_uw09j68u")
    guard let newUrl = url else{
        return
    }
    let request = URLRequest(url: newUrl)
    let session = URLSession(configuration: URLSessionConfiguration.default)
    //URLSession.shared.dataTask(with: request) { (data, response, error) in
    //    //
    //}
    let task = session.dataTask(with: request) { (data, response, error) in
        guard let data = data else{
            return
        }
        do{
            let result = try JSONDecoder().decode(MyResult.self, from: data)
            //print(result.items[0].header ?? "")
            complitionHandler(result)
        }catch let error{
            print("Here")
            print(error.localizedDescription)
            complitionHandler(nil)
        }
        
        
    }
    task.resume()
    
    }
}
