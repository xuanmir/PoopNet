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
    let date: String
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
            return "brain.filled.head.profile"
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
            return .green
        case .inTransit:
            return .orange
        case .sequencing:
            return .purple
        case .rawDataOnchained:
            return .blue
        case .opinionReceived:
            return .pink
        }
    }
}

extension Sample {
    static let examples: [Sample] = [
        Sample(
            date: swiftDateToIsoDateString(today),
            location: "16 rue Daval",
            status: .waitingForPickup
        ),
        Sample(
            date: swiftDateToIsoDateString(yesterday),
            location: "16 rue Daval",
            status: .inTransit,
            isSelected: true
        ),
        Sample(
            date: "2024-01-08T23:44:58+0100",
            location: "Montigny Le Bretonneux",
            status: .sequencing
        ),
        Sample(
            date: "2023-07-21T19:40:15+0200",
            location: "Palais Brongniart",
            status: .rawDataOnchained
        ),
        Sample(
            date: "2023-07-20T18:03:00+0200",
            location: "Palais Brongniart",
            status: .opinionReceived
        )
    ]
}

//@Model
//class Sample: Identifiable {
//    var id = UUID()
//    var date: String
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
