//
//  WeatherStationList.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import Foundation
import SwiftUI

struct WeatherStationList: Decodable {
    
    let status: String
    let message: String
    var data: [WeatherStation]
    
}
