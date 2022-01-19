//
//  BusStationViewModel.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 20.09.2021.
//

import Foundation

class BusStationViewModel {
    
    var networkManager = NetworkManager()
    var stationResponse: [Station] = [Station]()
    
    func getStations(completion: @escaping () -> Void) {
        networkManager.getBusStation { (result) in
            guard let stations = result?.stations else { return }
            self.stationResponse = stations

            completion()
        }

    }
    
}
