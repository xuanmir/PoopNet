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
            ForEach(Sample.examples) { sample in
                SampleLineView(
                    isoDateString: sample.date,
                    location: sample.location,
                    status: sample.status,
                    isSelected: sample.isSelected
                )
                
                SampleLineFullBottomView(
                    isoDateString: sample.date,
                    location: sample.location,
                    status: sample.status,
                    isSelected: sample.isSelected
                )
                
                SampleLineCompactLeftView(
                    isoDateString: sample.date,
                    location: sample.location,
                    status: sample.status,
                    isSelected: sample.isSelected
                )
                
                SampleLineCompactRightView(
                    isoDateString: sample.date,
                    location: sample.location,
                    status: sample.status,
                    isSelected: sample.isSelected
                )
                
                SampleLineFullCenteredView(
                    isoDateString: sample.date,
                    location: sample.location,
                    status: sample.status,
                    isSelected: sample.isSelected
                )
                
                SampleLineBasicCenteredView(
                    isoDateString: sample.date,
                    location: sample.location,
                    status: sample.status,
                    isSelected: sample.isSelected
                )
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SamplesView()
}
