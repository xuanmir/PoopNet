//
//  ContentView.swift
//  PoopNet
//
//  Created by Juan Diosdado on 2023-07-23.
//

import SwiftUI

let waitingForPickup = "💩"
let inTransit = "🚚"
let arrivedAtLab = "⏳"
let sequencing = "🧬"
let analysisOnline = "🎉"

//enum sampleState {
//    case WaitingForPickup, InTransit, ArrivedAtLab, Sequencing, AnalysisReady
//}

struct ContentView: View {
    var body: some View {
        TabView {
            VStack {
                HStack {
                    Text("\(waitingForPickup)")
                        .font(.system(size: 36))
                        .frame(width: 60, height: 60)
                        .background(.quaternary)
                        .clipShape(.circle)
                    VStack {
                        Text("Today · 5 min ago")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("16 Place de la Bourse, 75002 Paris")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.secondary)
                    }
                }
                
                HStack {
                    Text("\(inTransit)")
                        .font(.system(size: 36))
                        .frame(width: 60, height: 60)
                        .background(.quaternary)
                        .clipShape(.circle)
                    VStack {
                        Text("Yesterday · 15:20")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("16 Place de la Bourse, 75002 Paris")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.secondary)
                    }
                }
                
                HStack {
                    Text("\(sequencing)")
                        .font(.system(size: 36))
                        .frame(width: 60, height: 60)
                        .background(.quaternary)
                        .clipShape(.circle)
                    VStack {
                        Text("July 21 · 19:40")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("16 Place de la Bourse, 75002 Paris")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.secondary)
                    }
                }

                HStack {
                    Text("\(analysisOnline)")
                        .font(.system(size: 36))
                        .frame(width: 60, height: 60)
                        .background(.quaternary)
                        .clipShape(.circle)
                    VStack {
                        Text("July 20 · 18:03")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("24 Rue Saint-Victor, 75005 Paris")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
            }
            .padding()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            Text("Population")
                .tabItem {
                    Label("Population", systemImage: "chart.xyaxis.line")
                }
            
//            Text("Search")
//                .tabItem {
//                    Label("Search", systemImage: "magnifyingglass")
//                }
            
            Text("Scan Container QR Code")
                .tabItem {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            
            Text("Notifications")
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
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
