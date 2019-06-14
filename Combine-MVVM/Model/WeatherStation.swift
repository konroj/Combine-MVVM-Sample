//
//  WeatherStation.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import Foundation
import SwiftUI

struct WeatherStation: Decodable, Hashable, Identifiable {
    
    let no: Int
    let name: String
    let active: Bool
    let rain: Bool
    let water: Bool
    let winddir: Bool
    let windlevel: Bool
    
    var activeSymbols: [MeasurementSymbol] {
        var symbols = [MeasurementSymbol]()
        
        if rain {
            symbols.append(.rain)
        }
        
        if water {
            symbols.append(.water)
        }
        
        if winddir {
            symbols.append(.windDirection)
        }
        
        if windlevel {
            symbols.append(.windLevel)
        }
        
        return symbols
    }
    
    func symbol(for message: String?) -> MeasurementSymbol? {
        guard let message = message else { return nil }
        
        switch message {
        case "Wartości opadu":
            return .rain
        case "Wartości prędkości wiatru":
            return .windLevel
        case "Wartości kierunku wiatru":
            return .windDirection
        case "Wartości poz. wody":
            return .water
        default:
            return nil
        }
    }
    
    var id: Int {
        return no
    }
    
}
