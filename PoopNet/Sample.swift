//
//  Sample.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-01-14.
//

import SwiftData
import SwiftUI

@Model
class Sample {
    var date: Date
    var location: String
    var status: SampleStatus
    
    init(date: Date, location: String, status: SampleStatus) {
        self.date = date
        self.location = location
        self.status = status
    }
}

enum SampleStatus: Codable {
    case waitingForPickup
    case inTransit
    case sequencing
    case analysisReady
}

//enum SampleStatus: Codable {
//    case waiting, transit, sequencing, published
//}

// Text, Image, Color
