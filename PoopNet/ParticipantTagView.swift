//
//  ParticipantTagView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-02-28.
//

import SwiftUI

struct ParticipantTagView: View {
    let role: ParticipantRole
    
    var body: some View {
        Label(role.text, systemImage: role.symbol)
            .padding(12)
            .background(.primary.opacity(0.2))
            .clipShape(Capsule())
            .foregroundStyle(role.color)
        
        HStack {
            Image(systemName: role.symbol)
                .foregroundStyle(role.color)
            Text(role.text)
        }
        .padding(12)
        .background(role.color.opacity(0.2))
        .clipShape(Capsule())
    }
}

#Preview {
    VStack {
        ParticipantTagView(role: .pooper)
        
        ParticipantTagView(role: .sampleTransportationDriver)
        
        ParticipantTagView(role: .sampleSequencingLaboratory)
        
        ParticipantTagView(role: .dataInterpretationProfessional)
    }
}
