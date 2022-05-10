//
//  JsonResponse.swift
//  MVVM
//
//  Created by Karam Ibrahim on 5/9/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation

struct JsonResponse: Codable {
    let items: [Result]
    let errorMessage: String?
}
