//
//  Bus.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 20.09.2021.
//

import Foundation

struct Bus: Codable {
    
   var remainingTime : Int? = 12
   var plate : String?
   var routeCode : String?
   var icon : String?
    
}
