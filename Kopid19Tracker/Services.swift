//
//  Services.swift
//  Kopid19Tracker
//
//  Created by Izzan Oktiadi on 24/11/20.
//

import Foundation

class Services {
    func getCovidTrackingResult(completion: @escaping ([Tracking]?) -> Void) {

        //For US Data
//        guard let url = URL(string: "https://api.covidtracking.com/v1/states/current.json") else {
//            fatalError("Invalid URL")
//        }
        
        // For ID Data
        guard let url = URL(string: "https://api.kawalcorona.com/indonesia/provinsi/") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(nil)
            }
            
            let trackingList = try? JSONDecoder().decode([Tracking].self, from: data)
            completion(trackingList)
        }.resume()
    }
}
