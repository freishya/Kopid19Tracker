//
//  TrackingViewModel.swift
//  Kopid19Tracker
//
//  Created by Izzan Oktiadi on 24/11/20.
//

import Foundation

class TrackingListViewModel: ObservableObject {
    @Published var trackings = [TrackingViewModel]()
    
    func getTrackingData() {
        Services().getCovidTrackingResult{ trackingList in
            if let trackingList = trackingList {
                DispatchQueue.main.async {
                    self.trackings = trackingList.map(TrackingViewModel.init)
                }
            }
            
        }
    }
}

class TrackingViewModel {
    var tracking: Tracking
    
    init(tracking: Tracking) {
        self.tracking = tracking
    }
    
    // For ID Data
    var fid: Int {
        return self.tracking.attributes.fid
    }
    
    var province: String {
        return self.tracking.attributes.provinsi
    }
    
    var positive: Int {
        return self.tracking.attributes.kasusPosi
    }
    
    var death: Int {
        return self.tracking.attributes.kasusMeni
    }
    
    var recovered: Int {
        return self.tracking.attributes.kasusSemb
    }

// For US Data
//    let id: UUID = UUID()
//
//    var state: String {
//        return self.tracking.state
//    }
//
//    var total: Int {
//        return self.tracking.total
//    }
//
//    var positive: Int {
//        return self.tracking.positive
//    }
//
//    var death: Int {
//        return self.tracking.death
//    }
//
//    var hospitalized: Int {
//        return self.tracking.hospitalized ?? 0
//    }
}
