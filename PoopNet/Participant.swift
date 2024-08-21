//
//  Participant.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-02-28.
//

import Foundation
import SwiftUI

struct Participant: Identifiable {
    let id = UUID()
    let name: String
    let dateOfBirth: Date
    let sex: ParticipantSex
    let role: ParticipantRole
    let entityType: EntityType
}

enum ParticipantRole {
    case pooper
    case sampleTransportationDriver
    case sampleSequencingLaboratory
//    case sampleSequencingTechnician
    case dataInterpretationProfessional
//    case dataInterpretationService
    
    var text: String {
        switch self {
        case .pooper:
            return "Pooper"
        case .sampleTransportationDriver:
            return "Driver"
        case .sampleSequencingLaboratory:
            return "Sequencing Lab"
        case .dataInterpretationProfessional:
            return "Data Interpreter"
        }
    }
    
    var symbol: String {
        switch self {
        case .pooper:
            return "person.fill"
        case .sampleTransportationDriver:
            return "truck.box.fill"
        case .sampleSequencingLaboratory:
            return "building.fill"
        case .dataInterpretationProfessional:
            return "brain.filled.head.profile"
        }
    }
    
    var color: Color {
        switch self {
        case .pooper:
            return .green
        case .sampleTransportationDriver:
            return .orange
        case .sampleSequencingLaboratory:
            return .purple
        case .dataInterpretationProfessional:
            return .pink
        }
    }
}

enum ParticipantSex {
    case female
    case male
}

enum EntityType {
    case individual    // human
    case collective    // organization
    case automaton
}
