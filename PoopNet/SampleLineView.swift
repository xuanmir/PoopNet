//
//  SampleLineView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-01-15.
//

import SwiftUI

struct SampleLineView: View {
    let isoDateString: String
    let location: String
    let status: SampleStatus
    @State var withStroke: Bool
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var tick = true
    
    var body: some View {
        let formattedDate = isoDateStringToPrettyDateString(isoDateString)
        
        VStack {
            SampleStatusIndicator(status: status)
            Text(formattedDate)
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(location)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(24)
        .background(status.color.opacity(tick ? 0.08 : 0.08))
        .background(.regularMaterial.opacity(0.26))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(status.color.opacity(withStroke ? 40 : 0))
        )
        .onTapGesture {
            withStroke.toggle()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 2)
        .onReceive(timer) { _ in
            tick.toggle()
        }
    }
}

struct SampleStatusIndicator: View {
    let status: SampleStatus
    
    var body: some View {
        HStack(spacing: 2) {
            switch status {
            case .waitingForPickup:
                Image(systemName: SampleStatus.waitingForPickup.symbolActive)
                    .foregroundStyle(status.color)
                Text("···")
                Image(systemName: SampleStatus.inTransit.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.sequencing.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.rawDataOnchained.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.opinionReceived.symbolInactive)
            case .inTransit:
                Image(systemName: SampleStatus.waitingForPickup.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.inTransit.symbolActive)
                    .foregroundStyle(status.color)
                Text("···")
                Image(systemName: SampleStatus.sequencing.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.rawDataOnchained.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.opinionReceived.symbolInactive)
            case .sequencing:
                Image(systemName: SampleStatus.waitingForPickup.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.inTransit.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.sequencing.symbolActive)
                    .foregroundStyle(status.color)
                Text("···")
                Image(systemName: SampleStatus.rawDataOnchained.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.opinionReceived.symbolInactive)
            case .rawDataOnchained:
                Image(systemName: SampleStatus.waitingForPickup.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.inTransit.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.sequencing.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.rawDataOnchained.symbolActive)
                    .foregroundStyle(status.color)
                Text("···")
                Image(systemName: SampleStatus.opinionReceived.symbolInactive)
            case .opinionReceived:
                Image(systemName: SampleStatus.waitingForPickup.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.inTransit.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.sequencing.symbolInactive)
                Text("···")
                Image(systemName: SampleStatus.rawDataOnchained.symbolInactive)
                Text("···")
                Image(systemName: status.symbolActive)
                    .foregroundStyle(status.color)
            }
        }
        .font(.callout)
        .foregroundStyle(.tertiary)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Text(status.text)
            .font(.callout)
            .foregroundStyle(status.color)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SampleStatusIndicator2: View {
    let status: SampleStatus
    
    var body: some View {
        HStack {
            Image(systemName: status.symbolActive)
            Text(status.text)
        }
        .font(.callout)
        .foregroundStyle(status.color)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    VStack {
        SampleLineView(isoDateString: Date.now.formatted(.iso8601), location: "PoopNet", status: .waitingForPickup, withStroke: false)
        
        SampleLineView(isoDateString: Date.now.formatted(.iso8601), location: "PoopNet", status: .inTransit, withStroke: false)
        
        SampleLineView(isoDateString: Date.now.formatted(.iso8601), location: "PoopNet", status: .sequencing, withStroke: false)
        
        SampleLineView(isoDateString: Date.now.formatted(.iso8601), location: "PoopNet", status: .rawDataOnchained, withStroke: false)
        
        SampleLineView(isoDateString: Date.now.formatted(.iso8601), location: "PoopNet", status: .opinionReceived, withStroke: false)
    }
}
