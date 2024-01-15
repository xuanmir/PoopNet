//
//  ContentView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2023-07-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SamplesView()
                .tabItem {
                    Label("Samples", systemImage: "list.bullet")
                }
            
            Text("Gut Microbiome Population")
                .tabItem {
                    Label("Population", systemImage: "chart.xyaxis.line")
                }
            
            Text("Scan Container QR Code")
                .tabItem {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            
            Text("Calendar")
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
//            Text("Search")
//                .tabItem {
//                    Label("Search", systemImage: "magnifyingglass")
//                }
            
//            Text("Notifications")
//                .tabItem {
//                    Label("Notifications", systemImage: "bell")
//                }
            
//            Text("Profile")
//                .tabItem {
//                    Label("Profile", systemImage: "person.circle")
//                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
