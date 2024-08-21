//
//  Sample.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-01-14.
//

import Foundation
import SwiftUI

//@Model
//class Sample: Identifiable {
//    var id = UUID()
//    var container: Container
//    var date: Date
//    var location: String
//    var status: SampleStatus
//    let sampleAddress: String
//    let previousSampleAddress: String?
//
//    var isoFormattedDateString: String {
//        date.formatted(.iso8601)
//    }
//    
//    var prettyFormattedDateString: String {
//        "\(date.formatted(.dateTime.year().month().day())) · \(date.formatted(.dateTime.hour().minute()))"
//    }
//}

//struct Sample: Identifiable {
//    let id = UUID()
//    let container: String
//    let date: Date
//    let location: String
//    let status: SampleStatus
//    let sampleAddress: String
//    let previousSampleAddress: String?
//    
//    var isoFormattedDateString: String {
//        date.formatted(.iso8601)
//    }
//    
//    var prettyFormattedDateString: String {
//        swiftDateToPrettyDateString(date)
//    }
//}

enum SampleStatus {
    case waitingForPickup
    case inTransit
    case sequencing
    case rawDataOnchained
    case opinionReceived
    
    var text: String {
        switch self {
        case .waitingForPickup:
            return "Waiting for pickup"
        case .inTransit:
            return "In transit"
        case .sequencing:
            return "Sequencing"
        case .rawDataOnchained:
            return "Raw data onchained"
        case .opinionReceived:
            return "Opinion received"
        }
    }
    
    var symbolActive: String {
        switch self {
        case .waitingForPickup:
            return "shippingbox.fill"
        case .inTransit:
            return "truck.box.fill"
        case .sequencing:
            return "microbe.fill"
        case .rawDataOnchained:
            return "doc.text.fill"
        case .opinionReceived:
            return "brain.filled.head.profile"
        }
    }
    
    var symbolInactive: String {
        switch self {
        case .waitingForPickup:
            return "shippingbox"
        case .inTransit:
            return "truck.box"
        case .sequencing:
            return "microbe"
        case .rawDataOnchained:
            return "doc.text"
        case .opinionReceived:
            return "brain.head.profile"
        }
    }
        
    var color: Color {
        switch self {
        case .waitingForPickup:
            return .green
        case .inTransit:
            return .orange
        case .sequencing:
            return .purple
        case .rawDataOnchained:
            return .blue
        case .opinionReceived:
            return .pink
        }
    }
}

//enum SampleStatus2: String, CaseIterable {
//    case waitingForPickup
//    case inTransit
//    case sequencing
//    case rawDataOnchained
//    case opinionReceived
//}

//struct Container: Identifiable {
//    let id = UUID()
//    let location: String
//}

//Text, Image, Color

//func isoDateStringToSwiftDate(_ isoDateString: String) -> Date {
//    do {
//        // Convert an ISO8601FormatString to a Date
//        return try Date.ISO8601FormatStyle().parseStrategy.parse(isoDateString)
//    } catch {
//        print("Invalid ISO8601FormatString\n\(isoDateString)")
//        // How can we return something more useful than just the current date?
//        return Date.now
//    }
//}

func isoDateStringToPrettyDateString(_ isoDateString: String) -> String {
    do {
        // Convert an ISO8601FormatString to a Date
        let swiftDate = try Date.ISO8601FormatStyle().parseStrategy.parse(isoDateString)
        
        // Convert a Date to a String that's formatted differently in relation to the current date
        return swiftDateToPrettyDateString(swiftDate)
    } catch {
        return "Invalid ISO8601FormatString\n\(isoDateString)"
    }
}

//func swiftDateToIsoDateString(_ swiftDate: Date) -> String {
//    swiftDate.formatted(.iso8601)
//}

//func swiftDateToIsoDateStringCompact(_ swiftDate: Date) -> String {
//    swiftDate.formatted(.iso8601.dateSeparator(.omitted).timeSeparator(.omitted).timeZoneSeparator(.omitted))
//}

//func swiftDateToPrettyDateString1(_ date: Date) -> String {
//    let dateDay = date.formatted(.dateTime.year().month().day())
//    let currentDay = Date.now.formatted(.dateTime.year().month().day())
//    let previousDay = Calendar.current.date(byAdding: .day, value: -1, to: Date())!.formatted(.dateTime.year().month().day())
//    let dateYear = date.formatted(.dateTime.year())
//    let currentYear = Date.now.formatted(.dateTime.year())
//    
//    if dateDay == currentDay {
//        return "Today · \(date.formatted(.relative(presentation: .numeric)))"
//    } else if dateDay == previousDay {
//        return "Yesterday · \(date.formatted(.dateTime.hour().minute()))"
//    } else if dateYear == currentYear {
//        return "\(date.formatted(.dateTime.month().day())) · \(date.formatted(.dateTime.hour().minute()))"
//    } else {
//        return "\(date.formatted(.dateTime.year().month().day())) · \(date.formatted(.dateTime.hour().minute()))"
//    }
//}

func swiftDateToPrettyDateString(_ date: Date) -> String {
    enum DateType {
        case currentDay
        case previousDay
        case currentYear
        case previousYears
    }
    
    let dateType: DateType
    let dateDay = date.formatted(.dateTime.year().month().day())
    let currentDay = Date.now.formatted(.dateTime.year().month().day())
    let previousDay = Calendar.current.date(byAdding: .day, value: -1, to: Date())!.formatted(.dateTime.year().month().day())
    let dateYear = date.formatted(.dateTime.year())
    let currentYear = Date.now.formatted(.dateTime.year())
    
    if dateDay == currentDay {
        dateType = .currentDay
    } else if dateDay == previousDay {
        dateType = .previousDay
    } else if dateYear == currentYear {
        dateType = .currentYear
    } else {
        dateType = .previousYears
    }
    
    switch dateType {
    case .currentDay:
        return "Today · \(date.formatted(.relative(presentation: .numeric)))"
    case .previousDay:
        return "Yesterday · \(date.formatted(.dateTime.hour().minute()))"
    case .currentYear:
        return "\(date.formatted(.dateTime.month().day())) · \(date.formatted(.dateTime.hour().minute()))"
    case .previousYears:
        return "\(date.formatted(.dateTime.year().month().day())) · \(date.formatted(.dateTime.hour().minute()))"
    }
}

//func swiftDateToPrettyDateStringBasic(_ date: Date) -> String {
//    let dateYear = date.formatted(.dateTime.year())
//    let currentYear = Date.now.formatted(.dateTime.year())
//    
//    if dateYear == currentYear {
//        return "\(date.formatted(.dateTime.month().day())) · \(date.formatted(.dateTime.hour().minute()))"
//    } else {
//        return "\(date.formatted(.dateTime.year().month().day())) · \(date.formatted(.dateTime.hour().minute()))"
//    }
//}

//func swiftDateToRelativeDateString(_ date: Date) -> String {
//    date.formatted(.relative(presentation: .numeric))
//}

//func decodeFromIsoDateJson() {
//    let decoder = JSONDecoder()
//    decoder.dateDecodingStrategy = .iso8601
//    
//    // more code to come
//}

//func encodeToIsoDateJson() {
//    let encoder = JSONEncoder()
//    encoder.dateEncodingStrategy = .iso8601
//    
//    // more code to come
//}

struct Sample: Identifiable {
    let id = UUID()
    let date: String
    let location: String
    let status: SampleStatus
    var withStroke: Bool = false
    
    static let examples: [Sample] = [
        Sample(
            date: Date().formatted(.iso8601),
            location: "16 rue Daval",
            status: .waitingForPickup
        ),
//        Sample(
//            date: "2024-03-02T14:00:00+0100",
//            location: "16 rue Daval",
//            status: .waitingForPickup
//        ),
//        Sample(
//            date: "2024-03-02T03:44:21+0100",
//            location: "16 rue Daval",
//            status: .waitingForPickup
//        ),
        Sample(
            date: "2024-03-01T19:20:11+0100",
            location: "16 rue Daval",
            status: .inTransit,
            withStroke: true
        ),
        Sample(
            date: "2024-01-08T23:44:58+0100",
            location: "Montigny Le Bretonneux",
            status: .sequencing
        ),
        Sample(
            date: "2023-07-21T19:40:15+0200",
            location: "Palais Brongniart",
            status: .rawDataOnchained
        ),
        Sample(
            date: "2023-07-20T18:03:00+0200",
            location: "Palais Brongniart",
            status: .opinionReceived
        )
    ]
}

//let samples: [Sample] = [
//    Sample(
//        date: Date().formatted(.iso8601),
//        location: "16 rue Daval",
//        status: .waitingForPickup,
//        withStroke: true
//    ),
//    Sample(
//        date: "2024-03-02T14:00:00+0100",
//        location: "16 rue Daval",
//        status: .waitingForPickup
//    ),
//    Sample(
//        date: "2024-03-02T03:44:21+0100",
//        location: "16 rue Daval",
//        status: .waitingForPickup
//    ),
//    Sample(
//        date: "2024-03-01T19:20:11+0100",
//        location: "16 rue Daval",
//        status: .inTransit
//    ),
//    Sample(
//        date: "2024-01-08T23:44:58+0100",
//        location: "Montigny Le Bretonneux",
//        status: .sequencing
//    ),
//    Sample(
//        date: "2023-07-21T19:40:15+0200",
//        location: "Palais Brongniart",
//        status: .rawDataOnchained
//    ),
//    Sample(
//        date: "2023-07-20T18:03:00+0200",
//        location: "Palais Brongniart",
//        status: .opinionReceived
//    )
//]
