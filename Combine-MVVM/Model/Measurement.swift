//
//  Measurement.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import Foundation
import SwiftUI

struct Measurement: Decodable, Hashable, Identifiable {
    
    let date: Date
    let value: Float?
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        let dateString = try container.decode(String.self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        date = dateFormatter.date(from: dateString)!
        value = try? container.decode(Float.self)
    }
    
    var id: Int {
        return Int(date.timeIntervalSince1970)
    }
    
}
