//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 20/05/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @ObservedObject private var ModelArray = ListViewModel()
    @State private var isShowingSettings: Bool = false
    
    var body: some View {
    // MARK: - BODY
        NavigationView {
          List {
            if ModelArray.modelList.count > 0 {
                CoverListView(coverModel: ModelArray.modelList.prefix(10).shuffled())
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            
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
    }
}



