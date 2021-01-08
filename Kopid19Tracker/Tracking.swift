//
//  Tracking.swift
//  Kopid19Tracker
//
//  Created by Izzan Oktiadi on 24/11/20.
//

import Foundation

// for US Data
// struct Tracking: Decodable {
//    let state: String
//    let total: Int
//    let positive: Int
//    let death: Int
//    let hospitalized: Int?
//}

// For ID Data
struct Tracking: Codable {
    let attributes: Attributes
}

struct Attributes: Codable {
    let fid, kodeProvi: Int
    let provinsi: String
    let kasusPosi, kasusSemb, kasusMeni: Int

    enum CodingKeys: String, CodingKey {
        case fid = "FID"
        case kodeProvi = "Kode_Provi"
        case provinsi = "Provinsi"
        case kasusPosi = "Kasus_Posi"
        case kasusSemb = "Kasus_Semb"
        case kasusMeni = "Kasus_Meni"
    }
}
