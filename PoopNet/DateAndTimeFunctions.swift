//
//  DateAndTimeFunctions.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2024-08-27.
//

import Foundation

let today = Date.now
let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date.now)!

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

func swiftDateToIsoDateString(_ swiftDate: Date) -> String {
    // Convert a Date to an ISO8601FormatString
    swiftDate.formatted(.iso8601)
}

func swiftDateToPrettyDateString(_ swiftDate: Date) -> String {
    let dateDay = swiftDate.formatted(.dateTime.year().month().day())
    let dateYear = swiftDate.formatted(.dateTime.year())
    
    let today = Date.now
    let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date.now)!
    
    let currentDay = today.formatted(.dateTime.year().month().day())
    let previousDay = yesterday.formatted(.dateTime.year().month().day())
    let currentYear = today.formatted(.dateTime.year())
    
    enum DateType {
        case currentDay
        case previousDay
        case currentYear
        case previousYears
    }
    
    let dateType: DateType
    
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
        return "Today · \(swiftDate.formatted(.relative(presentation: .numeric)))"
    case .previousDay:
        return "Yesterday · \(swiftDate.formatted(.dateTime.hour().minute()))"
    case .currentYear:
        return "\(swiftDate.formatted(.dateTime.month().day())) · \(swiftDate.formatted(.dateTime.hour().minute()))"
    case .previousYears:
        return "\(swiftDate.formatted(.dateTime.year().month().day())) · \(swiftDate.formatted(.dateTime.hour().minute()))"
    }
}

//func isoDateStringToSwiftDate(_ isoDateString: String) -> Date {
//   do {
//       // Convert an ISO8601FormatString to a Date
//       return try Date.ISO8601FormatStyle().parseStrategy.parse(isoDateString)
//   } catch {
//       print("Invalid ISO8601FormatString\n\(isoDateString)")
//       // How can we return something more useful than just the current date?
//       return Date.now
//   }
//}

//func swiftDateToPrettyDateStringBasic(_ swiftDate: Date) -> String {
//    let dateYear = swiftDate.formatted(.dateTime.year())
//    let currentYear = Date.now.formatted(.dateTime.year())
//
//    if dateYear == currentYear {
//        return "\(swiftDate.formatted(.dateTime.month().day())) · \(swiftDate.formatted(.dateTime.hour().minute()))"
//    } else {
//        return "\(swiftDate.formatted(.dateTime.year().month().day())) · \(swiftDate.formatted(.dateTime.hour().minute()))"
//    }
//}

//func swiftDateToRelativeDateString(_ swiftDate: Date) -> String {
//    swiftDate.formatted(.relative(presentation: .numeric))
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
