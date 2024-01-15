//
//  SampleStatusView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-01-15.
//

import SwiftUI

struct SampleStatusView: View {
    let status: SampleStatus
    
    var body: some View {
        switch status {
        case .waitingForPickup:
            VStack {
                HStack(spacing: 2) {
                    Image(systemName: "shippingbox.fill")
                        .foregroundStyle(.green)
                    Text("···")
                    Image(systemName: "truck.box")
                    Text("···")
                    Image(systemName: "microbe")
                    Text("···")
                    Image(systemName: "doc.text")
                }
                .font(.callout)
                .foregroundStyle(.tertiary)
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Waiting for pickup")
                    .font(.callout)
                    .foregroundStyle(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        case .inTransit:
            VStack {
                HStack(spacing: 2) {
                    Image(systemName: "shippingbox")
                    Text("···")
                    Image(systemName: "truck.box.fill")
                        .foregroundStyle(.orange)
                    Text("···")
                    Image(systemName: "microbe")
                    Text("···")
                    Image(systemName: "doc.text")
                }
                .font(.callout)
                .foregroundStyle(.tertiary)
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("In transit")
                    .font(.callout)
                    .foregroundStyle(.orange)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        case .sequencing:
            VStack {
                HStack(spacing: 2) {
                    Image(systemName: "shippingbox")
                    Text("···")
                    Image(systemName: "truck.box")
                    Text("···")
                    Image(systemName: "microbe.fill")
                        .foregroundStyle(.purple)
                    Text("···")
                    Image(systemName: "doc.text")
                }
                .font(.callout)
                .foregroundStyle(.tertiary)
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Sequencing")
                    .font(.callout)
                    .foregroundStyle(.purple)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        case .analysisReady:
            VStack {
                HStack(spacing: 2) {
                    Image(systemName: "shippingbox")
                    Text("···")
                    Image(systemName: "truck.box")
                    Text("···")
                    Image(systemName: "microbe")
                    Text("···")
                    Image(systemName: "doc.text.fill")
                        .foregroundStyle(.blue)
                }
                .font(.callout)
                .foregroundStyle(.tertiary)
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Analysis onchain")
                    .font(.callout)
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    SampleStatusView(status: .waitingForPickup)
}
