//
//  Sample.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-01-14.
//

import Foundation
import SwiftUI

struct Sample: Identifiable {
    let id = UUID()
    let date: Date
    let location: String
    let status: SampleStatus
    var isSelected: Bool = false
}

enum SampleStatus {
    case waitingForPickup
    case inTransit
    case sequencing
    case rawDataOnchained
    case opinionReceived
    
    var text: String {
        switch self {
        case .waitingForPickup:
            return "Waiting for pickup"
        case .inTransit:
            return "In transit"
        case .sequencing:
            return "Sequencing"
        case .rawDataOnchained:
            return "Raw data onchained"
        case .opinionReceived:
            return "Opinion received"
        }
    }
    
    var symbolActive: String {
        switch self {
        case .waitingForPickup:
            return "shippingbox.fill"
        case .inTransit:
            return "truck.box.fill"
        case .sequencing:
            return "microbe.fill"
        case .rawDataOnchained:
            return "doc.text.fill"
        case .opinionReceived:
//            return "brain.filled.head.profile"
//            return "heart.text.clipboard.fill"
            return "stethoscope"
        }
    }
    
    var symbolInactive: String {
        switch self {
        case .waitingForPickup:
            return "shippingbox"
        case .inTransit:
            return "truck.box"
        case .sequencing:
            return "microbe"
        case .rawDataOnchained:
            return "doc.text"
        case .opinionReceived:
            return "brain.head.profile"
        }
    }
        
    var color: Color {
        switch self {
        case .waitingForPickup:
            return .orange
        case .inTransit:
            return .orange
        case .sequencing:
            return .orange
        case .rawDataOnchained:
            return .green
        case .opinionReceived:
            return .blue
        }
    }
}

extension Sample {
    static let examples: [Sample] = [
        Sample(
            date: today,
            location: "16 rue Daval",
            status: .waitingForPickup
        ),
        Sample(
            date: yesterday,
            location: "16 rue Daval",
            status: .inTransit
        ),
        Sample(
            date: createSwiftDate(year: 2024, month: 08, day: 26, hour: 18, minute: 09, second: 12, timeZone: "UTC"),
            location: "16 rue Daval",
            status: .inTransit
        ),
        Sample(
            date: createSwiftDate(year: 2024, month: 08, day: 22, hour: 15, minute: 32, second: 06, timeZone: "UTC"),
            location: "16 rue Daval",
            status: .sequencing
        ),
        Sample(
            date: createSwiftDate(year: 2024, month: 01, day: 08, hour: 22, minute: 44, second: 58, timeZone: "UTC"),
            location: "Montigny Le Bretonneux",
            status: .rawDataOnchained
        ),
        Sample(
            date: createSwiftDate(year: 2023, month: 07, day: 21, hour: 17, minute: 40, second: 15, timeZone: "UTC"),
            location: "Palais Brongniart",
            status: .opinionReceived
        ),
        Sample(
            date: createSwiftDate(year: 2023, month: 07, day: 20, hour: 16, minute: 03, second: 00, timeZone: "UTC"),
            location: "Palais Brongniart",
            status: .rawDataOnchained
        ),
        Sample(
            date: createSwiftDate(year: 2022, month: 12, day: 03, hour: 12, minute: 30, second: 05, timeZone: "UTC"),
            location: "Fitness Park",
            status: .rawDataOnchained
        )
    ]
}

//@Model
//class Sample: Identifiable {
//    var id = UUID()
//    var date: Date
//    var location: String
//    var status: SampleStatus
//    var isSelected: Bool = false
//    
//    var container: Container
//    let sampleAddress: String
//    let previousSampleAddress: String?
//}

//@Model
//class Container: Identifiable {
//    var id = UUID()
//    var location: String
//}

//enum SampleStatus2: String, CaseIterable {
//    case waitingForPickup
//    case inTransit
//    case sequencing
//    case rawDataOnchained
//    case opinionReceived
//}
