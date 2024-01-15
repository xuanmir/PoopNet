//
//  SamplesView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2023-11-23.
//

import SwiftUI

struct SamplesView: View {
    var body: some View {
        ScrollView {
            VStack {
//                HStack(spacing: 2) {
//                    Image(systemName: "shippingbox.fill")
//                        .foregroundStyle(.green)
//                    Text("···")
//                    Image(systemName: "truck.box")
//                    Text("···")
//                    Image(systemName: "microbe")
//                    Text("···")
//                    Image(systemName: "doc.text")
//                }
//                .font(.callout)
//                .foregroundStyle(.tertiary)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                Text("Waiting for pickup")
//                    .font(.callout)
//                    .foregroundStyle(.green)
//                    .frame(maxWidth: .infinity, alignment: .leading)
                SampleStatusView(status: .waitingForPickup)
                Text("Today · 5 min ago")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Palais Brongniart")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.regularMaterial)
            .background(.green.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
//                HStack(spacing: 2) {
//                    Image(systemName: "shippingbox")
//                    Text("···")
//                    Image(systemName: "truck.box.fill")
//                        .foregroundStyle(.orange)
//                    Text("···")
//                    Image(systemName: "microbe")
//                    Text("···")
//                    Image(systemName: "doc.text")
//                }
//                .font(.callout)
//                .foregroundStyle(.tertiary)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                Text("In transit")
//                    .font(.callout)
//                    .foregroundStyle(.orange)
//                    .frame(maxWidth: .infinity, alignment: .leading)
                SampleStatusView(status: .inTransit)
                Text("Yesterday · 15:20")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Palais Brongniart")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.regularMaterial)
            .background(.orange.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
//                HStack(spacing: 2) {
//                    Image(systemName: "shippingbox")
//                    Text("···")
//                    Image(systemName: "truck.box")
//                    Text("···")
//                    Image(systemName: "microbe.fill")
//                        .foregroundStyle(.purple)
//                    Text("···")
//                    Image(systemName: "doc.text")
//                }
//                .font(.callout)
//                .foregroundStyle(.tertiary)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                Text("Sequencing")
//                    .font(.callout)
//                    .foregroundStyle(.purple)
//                    .frame(maxWidth: .infinity, alignment: .leading)
                SampleStatusView(status: .sequencing)
                Text("July 21 · 19:40")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Palais Brongniart")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.regularMaterial)
            .background(.purple.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
//                HStack(spacing: 2) {
//                    Image(systemName: "shippingbox")
//                    Text("···")
//                    Image(systemName: "truck.box")
//                    Text("···")
//                    Image(systemName: "microbe")
//                    Text("···")
//                    Image(systemName: "doc.text.fill")
//                        .foregroundStyle(.blue)
//                }
//                .font(.callout)
//                .foregroundStyle(.tertiary)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                Text("Analysis onchain")
//                    .font(.callout)
//                    .foregroundStyle(.blue)
//                    .frame(maxWidth: .infinity, alignment: .leading)
                SampleStatusView(status: .analysisReady)
                Text("July 20 · 18:03")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Maison de la Mutualité")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.regularMaterial)
            .background(.blue.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            SampleLineView(date: Date.now, location: "Palais Brongniart", status: .waitingForPickup)
            
            SampleLineView(date: Date.now, location: "Palais Brongniart", status: .inTransit)
        }
        .padding(.horizontal, 16)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SamplesView()
}
