//
//  SamplesView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2023-11-23.
//

import SwiftUI

struct SamplesView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(Sample.examples) { sample in
                    SampleLineCompactView(
                        date: sample.date,
                        location: sample.location,
                        status: sample.status,
                        isSelected: sample.isSelected
                    )
                }
                
//                ForEach(Sample.examples) { sample in
//                    SampleLineView(
//                        date: sample.date,
//                        location: sample.location,
//                        status: sample.status,
//                        isSelected: sample.isSelected
//                    )
//    
//                    SampleLineFullBottomView(
//                        date: sample.date,
//                        location: sample.location,
//                        status: sample.status,
//                        isSelected: sample.isSelected
//                    )
//    
//                    SampleLineFullCenteredView(
//                        date: sample.date,
//                        location: sample.location,
//                        status: sample.status,
//                        isSelected: sample.isSelected
//                    )
//    
//                    SampleLineBasicCenteredView(
//                        date: sample.date,
//                        location: sample.location,
//                        status: sample.status,
//                        isSelected: sample.isSelected
//                    )
//                }
            }
            .navigationTitle("Samples")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SamplesView()
}
