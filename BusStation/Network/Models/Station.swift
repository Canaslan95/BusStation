//
//  Station.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 20.09.2021.
//

import Foundation

struct Station: Codable {
    
    var stationName: String
    var stationCode: String
    var location: Location?
    var buses: [Bus]?
    
}
