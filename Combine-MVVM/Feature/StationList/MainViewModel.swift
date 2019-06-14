//
//  MainViewModel.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import SwiftUI
import Combine

final class MainViewModel: BindableObject {
    var didChange = PassthroughSubject<MainViewModel, Never>()
    
    private(set) var weatherStations = [WeatherStation]() {
        didSet { didChange.send(self) }
    }
    
    private var cancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    deinit {
        cancellable?.cancel()
    }

    func fetchWeatherStations() {
        cancellable = URLSession.shared.send(WeatherAPI.stations)
            .decode(type: WeatherStationList.self, decoder: JSONDecoder())
            .map { $0.data }
            .replaceError(with: [])
            .assign(to: \.weatherStations, on: self)
    }
    
}

