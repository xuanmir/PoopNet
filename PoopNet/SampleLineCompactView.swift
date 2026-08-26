//
//  SampleLineCompactView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-08-28.
//

import SwiftUI

struct SampleLineCompactView: View {
    let date: Date
    let location: String
    let status: SampleStatus
    @State var isSelected: Bool/* = false*/
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var tick = true
    
    var prettyDateString: String {
        swiftDateToPrettyDateString(date)
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(prettyDateString)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(location)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            SampleStatusIndicatorCompact(status: status)
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

struct SampleStatusIndicatorCompact: View {
    let status: SampleStatus
    
    var body: some View {
//        VStack {
//            Image(systemName: status.symbolActive)
//                .font(.title3)
//            Text(status.text)
//                .multilineTextAlignment(.center)
//                .font(.caption2)
//                .frame(maxWidth: 62)
//        }
//        .foregroundStyle(status.color)
        
        VStack {
            Image(systemName: status.symbolActive)
                .font(.title3)
                .foregroundStyle(status.color)
            Text(status.text)
                .multilineTextAlignment(.center)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .frame(maxWidth: 62)
        }
    }
}

struct SampleListView: View {
    let samples: [Sample]
        
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var tick = true
    
    var body: some View {
        List(samples) { sample in
            HStack {
                VStack {
                    Text(swiftDateToPrettyDateString(sample.date))
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(sample.location)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                SampleStatusIndicatorCompact(status: sample.status)
            }
        }
        .opacity(tick ? 1 : 1)
        .onReceive(timer) { _ in
            tick.toggle()
        }
    }
}

struct SampleListBasicView: View {
    let samples: [Sample]
        
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var tick = true
    
    var body: some View {
        List(samples) { sample in
            HStack {
                Text(swiftDateToPrettyDateString(sample.date))
                    .font(.title3.bold())

                Spacer()

                Image(systemName: sample.status.symbolActive)
                    .font(.title3)
                    .foregroundStyle(sample.status.color)
                    .frame(maxWidth: 32)
            }
        }
        .opacity(tick ? 1 : 1)
        .onReceive(timer) { _ in
            tick.toggle()
        }
    }
}

#Preview {
    ScrollView {
        ForEach(Sample.examples) { sample in
            SampleLineCompactView(
                date: sample.date,
                location: sample.location,
                status: sample.status,
                isSelected: sample.isSelected
            )
        }
    }
    .scrollIndicators(.hidden)
}

#Preview("SampleListView") {
    SampleListView(samples: Sample.examples)
}

#Preview("SampleListBasicView") {
    SampleListBasicView(samples: Sample.examples)
}
