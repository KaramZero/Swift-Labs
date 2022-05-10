//
//  HomeViewModel.swift
//  MVVM
//
//  Created by Karam Ibrahim on 5/9/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

class HomeViewModel {
    var service : NetworkManager
    var bindResultToHomeView : (() -> ()) = {}
    
    var result : [Result]!{
        didSet{
            bindResultToHomeView()
        }
    }
    
    init(service: NetworkManager){
        self.service=service
    }
    
    func getItems(){
        self.service.getAllMovies{[weak self] (result) in
            self?.result = result?.items
        }
    }
}
