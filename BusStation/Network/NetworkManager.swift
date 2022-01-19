//
//  NetworkManager.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 20.09.2021.
//

import Foundation
class NetworkManager {
    
    func getBusStation(completionHandler: @escaping (Response?) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "https:private-ba4027-busremainingtime.apiary-mock.com/stations")!
        let decoder = JSONDecoder()
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            do {
                let json = try decoder.decode(Response?.self, from: data ?? Data())
                completionHandler(json)
            } catch let error {
                print("JSON error: \(error.localizedDescription)")
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
    
}
