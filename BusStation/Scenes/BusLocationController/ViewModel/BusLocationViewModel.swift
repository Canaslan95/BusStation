//
//  BusLocationViewModel.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 22.09.2021.
//

import Foundation

class BusLocationViewModel {
    var location: Location
    var stationName: String
    
    init(location: Location, stationName: String) {
        self.location = location
        self.stationName = stationName
    }
}
