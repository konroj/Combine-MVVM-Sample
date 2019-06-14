//
//  ContentView.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObjectBinding var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.weatherStations) { station in
                NavigationButton(destination: DetailView(viewModel: DetailViewModel(station: station))) {
                    MainViewStationRow(station: station)
                }
            }
            .navigationBarTitle(Text("Weather Stations"))
            .onAppear {
                self.viewModel.fetchWeatherStations()
            }
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
