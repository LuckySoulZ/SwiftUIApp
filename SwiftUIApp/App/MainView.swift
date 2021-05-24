//
//  MainView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 18/05/21.
//

import SwiftUI
import Combine
import Foundation

struct MainView: View {
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ContentView()
            .tabItem {
                Label("Browse", systemImage: "square.grid.2x2")
            }
            VideoListView()
            .tabItem {
                Label("Watch", systemImage: "play.rectangle")
            }
            MapView()
            .tabItem {
                Label("Locations", systemImage: "map")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    // MARK: - PREVIEW
    static var previews: some View {
        MainView()
    }
}
