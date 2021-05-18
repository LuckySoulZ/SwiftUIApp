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
    // MARK: - PROPERTIES
    @ObservedObject private var ModelArray = ListViewModel()
    @State private var isShowingSettings: Bool = false
    
    // MARK: - BODY
    var body: some View {
        TabView {
            NavigationView {
              List {
                ForEach(ModelArray.modelList.shuffled()) { item in
                  NavigationLink(destination: TvShowDetailView(tvshow: item)) {
                    TvShowRowView(tvshow: item)
                      .padding(.vertical, 4)
                  }
                }
              }
              .navigationTitle("Tv Shows")
              .navigationBarItems(
                trailing:
                  Button(action: {
                    isShowingSettings = true
                  }) {
                    Image(systemName: "slider.horizontal.3")
                  }
                  .sheet(isPresented: $isShowingSettings) {
                    SettingsView()
                  }
              )
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Label("Movies", image: "tvshow")
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
