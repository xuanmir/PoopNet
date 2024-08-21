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
                SampleLineView(isoDateString: sample.date, location: sample.location, status: sample.status, withStroke: sample.withStroke)
            }
        }
        .scrollIndicators(.hidden)
        
//        Text(Date().formatted(.dateTime.year().month(.wide).day()))
//
//        Text(Date().formatted(.dateTime.year().month().day()))
//
//        Text(Date().formatted(.dateTime.hour().minute().second()))
//
//        Text(Date().formatted(.iso8601))
//
//        Text(Date().formatted(.iso8601.dateSeparator(.omitted).timeSeparator(.omitted).timeZoneSeparator(.omitted)))
//
//        Text(Date().formatted(.iso8601.year().month().day()))
//
//        Text(Date().formatted(.iso8601.time(includingFractionalSeconds: false)))
//
//        Text(Date().formatted(.relative(presentation: .named)))
//
//        Text(Date().formatted(.relative(presentation: .numeric)))
//
//        Text("\(Date().formatted(.iso8601.year().month().day())) · \(Date().formatted(.dateTime.hour().minute()))")
//
//        Text("\(Date().formatted(.iso8601.year().month().day())) · \(Date().formatted(.iso8601.time(includingFractionalSeconds: false)))")
//
//        Text(Date().formatted(date: .abbreviated, time: .omitted))
//
//        Text(Date().formatted(date: .complete, time: .omitted))
//
//        Text(Date().formatted(date: .long, time: .omitted))
//
//        Text(Date().formatted(date: .numeric, time: .omitted))
//
//        Text(Date().formatted(date: .omitted, time: .complete))
//
//        Text(Date().formatted(date: .omitted, time: .shortened))
//
//        Text(Date().formatted(date: .omitted, time: .standard))
    }
}

#Preview {
    SamplesView()
}
