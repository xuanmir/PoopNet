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
            TabItemView(title: "Samples", icon: "list.bullet") {
                SamplesView()
            }
            
            TabItemView(title: "Population", icon: "chart.xyaxis.line") {
                Text("Gut Microbiome Population")
            }
            
            TabItemView(title: "Scan", icon: "qrcode.viewfinder") {
                Text("Scan Container QR Code")
            }
            
            TabItemView(title: "Calendar", icon: "calendar") {
                Text("Calendar")
            }
            
            TabItemView(title: "Search", icon: "magnifyingglass") {
                Text("Search")
            }
            
            TabItemView(title: "Notifications", icon: "bell") {
                Text("Notifications")
            }
            
            TabItemView(title: "Profile", icon: "person") {
                Text("Profile")
            }
            
            TabItemView(title: "Settings", icon: "gearshape") {
                Text("Settings")
            }
            
            TabItemView(title: "Data Streams", icon: "questionmark.square") {
                Text("Data Streams")
            }
            
            TabItemView(title: "Sharing", icon: "questionmark.square") {
                Text("Sharing")
            }
        }
    }
}

struct TabItemView<Content: View>: View {
    // Should we rename title to text and icon to symbol ???
    let title: String
    let icon: String
    let content: Content
    
    init(title: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    var body: some View {
        content
            .tabItem {
                Label(title, systemImage: icon)
            }
    }
}

#Preview {
    ContentView()
}
