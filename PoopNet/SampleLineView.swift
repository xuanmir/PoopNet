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
    @State var isSelected: Bool /*= false*/
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var tick = true
    
    var prettyDateString: String {
        swiftDateToPrettyDateString(date)
    }
    
    var body: some View {
        VStack {
            SampleStatusIndicator(status: status)
            Text(prettyDateString)
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
                .stroke(status.color.opacity(isSelected ? 1 : 0))
        )
        .onTapGesture {
            isSelected.toggle()
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
//        Text(status.text)
//            .font(.callout)
//            .foregroundStyle(status.color)
//            .frame(maxWidth: .infinity, alignment: .leading)
        
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

#Preview("FullTop") {
    ScrollView {
        ForEach(Sample.examples) { sample in
            SampleLineView(
                date: sample.date,
                location: sample.location,
                status: sample.status,
                isSelected: sample.isSelected
            )
        }
    }
    .scrollIndicators(.hidden)
}

#Preview("FullBottom") {
    ScrollView {
        ForEach(Sample.examples) { sample in
            SampleLineFullBottomView(
                date: sample.date,
                location: sample.location,
                status: sample.status,
                isSelected: sample.isSelected
            )
        }
    }
    .scrollIndicators(.hidden)
}

#Preview("FullCentered") {
    ScrollView {
        ForEach(Sample.examples) { sample in
            SampleLineFullCenteredView(
                date: sample.date,
                location: sample.location,
                status: sample.status,
                isSelected: sample.isSelected
            )
        }
    }
    .scrollIndicators(.hidden)
}

#Preview("BasicCentered") {
    ScrollView {
        ForEach(Sample.examples) { sample in
            SampleLineBasicCenteredView(
                date: sample.date,
                location: sample.location,
                status: sample.status,
                isSelected: sample.isSelected
            )
        }
    }
    .scrollIndicators(.hidden)
}

struct SampleLineFullBottomView: View {
    let date: Date
    let location: String
    let status: SampleStatus
    @State var isSelected: Bool /*= false*/
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var tick = true
    
    var prettyDateString: String {
        swiftDateToPrettyDateString(date)
    }
    
    var body: some View {
        VStack {
            Text(prettyDateString)
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(location)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            SampleStatusIndicator(status: status)
        }
        .padding(24)
        .background(status.color.opacity(tick ? 0.08 : 0.08))
        .background(.regularMaterial.opacity(0.26))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(status.color.opacity(isSelected ? 1 : 0))
        )
        .onTapGesture {
            isSelected.toggle()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 2)
        .onReceive(timer) { _ in
            tick.toggle()
        }
    }
}

struct SampleLineFullCenteredView: View {
    let date: Date
    let location: String
    let status: SampleStatus
    @State var isSelected: Bool /*= false*/
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var tick = true
    
    var prettyDateString: String {
        swiftDateToPrettyDateString(date)
    }
    
    var body: some View {
        VStack {
            Text(prettyDateString)
                .font(.title2.bold())
            Text(location)
                .foregroundStyle(.secondary)
            SampleStatusIndicatorFullCentered(status: status)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(status.color.opacity(tick ? 0.08 : 0.08))
        .background(.regularMaterial.opacity(0.26))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(status.color.opacity(isSelected ? 1 : 0))
        )
        .onTapGesture {
            isSelected.toggle()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 2)
        .onReceive(timer) { _ in
            tick.toggle()
        }
    }
}

struct SampleLineBasicCenteredView: View {
    let date: Date
    let location: String
    let status: SampleStatus
    @State var isSelected: Bool /*= false*/
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var tick = true
    
    var prettyDateString: String {
        swiftDateToPrettyDateString(date)
    }
    
    var body: some View {
        VStack {
            Text(prettyDateString)
                .font(.title2.bold())
            Text(location)
                .foregroundStyle(.secondary)
            SampleStatusIndicatorBasic(status: status)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(status.color.opacity(tick ? 0.08 : 0.08))
        .background(.regularMaterial.opacity(0.26))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(status.color.opacity(isSelected ? 1 : 0))
        )
        .onTapGesture {
            isSelected.toggle()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 2)
        .onReceive(timer) { _ in
            tick.toggle()
        }
    }
}

struct SampleStatusIndicatorFullCentered: View {
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
        
        Text(status.text)
            .font(.callout)
            .foregroundStyle(status.color)
    }
}

struct SampleStatusIndicatorBasic: View {
    let status: SampleStatus
    
    var body: some View {
        HStack {
            Image(systemName: status.symbolActive)
            Text(status.text)
        }
        .font(.callout)
        .foregroundStyle(status.color)
    }
}
