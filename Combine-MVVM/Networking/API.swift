//
//  API.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import Foundation

enum RESTType {
    case get
    case post
    case delete
    case put
}

protocol API {
    var baseUrl: String { get }
    var path: String { get }
    var method: RESTType { get }
}
