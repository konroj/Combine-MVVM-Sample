//
//  DetailViewModel.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

final class DetailViewModel: BindableObject {
    var didChange = PassthroughSubject<DetailViewModel, Never>()
    
    var station: WeatherStation
    
    init(station: WeatherStation) {
        self.station = station
    }
    
    private(set) var measurements = [Measurement]() {
        didSet { didChange.send(self) }
    }
    
    private var cancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func fetchMeasurements() {
        cancellable = URLSession.shared.send(WeatherAPI.measurements(station: station, symbol: station.activeSymbols.first!))
            .decode(type: MeasurementList.self, decoder: JSONDecoder())
            .map { $0.data ?? [] }
            .replaceError(with: [])
            .assign(to: \.measurements, on: self)
    }
    
}
