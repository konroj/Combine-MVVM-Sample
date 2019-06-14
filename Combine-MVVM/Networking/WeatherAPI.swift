//
//  WeatherAPI.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import Foundation

enum WeatherAPI {
    case stations
    case measurements(station: WeatherStation, symbol: MeasurementSymbol)
}

extension WeatherAPI: API {
    
    var baseUrl: String {
        return "https://pomiary.gdanskiewody.pl/rest/"
    }
    
    var path: String {
        switch self {
        case .stations:
            return "stations"
        case .measurements(let station, let symbol):
            return "measurements/\(station.no)/\(symbol.rawValue)/\(Date().dateString)"
        }
    }
    
    var method: RESTType {
        return .get
    }
    
}
