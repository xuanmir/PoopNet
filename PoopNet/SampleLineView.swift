//
//  SampleLineView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-01-15.
//

import SwiftUI

struct SampleLineView: View {
    let date: Date
    let location: String
    let status: SampleStatus
    
    var body: some View {
        let formattedDate = "\(date.formatted(.dateTime.month().day())) · \(date.formatted(.dateTime.hour().minute()))"
        
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
                Text(formattedDate)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(location)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.regularMaterial)
            .background(.green.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
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
                Text(formattedDate)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(location)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.regularMaterial)
            .background(.orange.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
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
                Text(formattedDate)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(location)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.regularMaterial)
            .background(.purple.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
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
                Text(formattedDate)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(location)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.regularMaterial)
            .background(.blue.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    SampleLineView(date: Date.now, location: "Palais Brongniart", status: .waitingForPickup)
}
