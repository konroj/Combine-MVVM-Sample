//
//  DetailView.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @ObjectBinding var viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.measurements) { measurement in
            Text(measurement.date.dateAndTimeString)
            Spacer()
            Text(String(measurement.value ?? 0.0))
        }
        .navigationBarTitle(Text(viewModel.station.name))
        .onAppear {
            self.viewModel.fetchMeasurements()
        }
    }
    
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(station: WeatherStation(no: 22, name: "", active: true, rain: true, water: true, winddir: true, windlevel: true)))
    }
}
#endif
