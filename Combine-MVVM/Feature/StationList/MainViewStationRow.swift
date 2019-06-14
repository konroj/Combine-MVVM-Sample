//
//  MainViewStationRow.swift
//  Combine-MVVM
//
//  Created by Konrad Roj on 13/06/2019.
//  Copyright © 2019 konradroj. All rights reserved.
//

import SwiftUI

struct MainViewStationRow: View {
    @State var station: WeatherStation
    
    var body: some View {
        HStack {
            Text(station.name)
            Spacer()
            HStack {
                ForEach((0..<station.activeSymbols.count), content: { index in
                    Image(self.station.activeSymbols[index].rawValue)
                    .resizable()
                    .frame(width: Length(28),
                           height: Length(28),
                           alignment: .center)
                    
                })
            }
        }
    }
    
}
