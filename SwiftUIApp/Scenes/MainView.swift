//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 13/05/21.
//

import SwiftUI
import Combine
import Foundation

struct MainView: View {
    @ObservedObject private var ModelArray = ListViewModel()
    
    var body: some View {
        TabView {
            List(ModelArray.modelList) { show in
                VStack(alignment: .center) {
                    NetworkImageView(imageUrl: show.image.original)
                        .padding(.top)
                    Text(show.name)
                    TextView(text: show.summary.html2AttributedString)
                        .frame(width: UIScreen.screenWidth - 60, height: 200)
                        .padding(.horizontal)
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
            }.tabItem {
                Label("Movies", image: "tvshow")
            }
            Text("The content of the first view")
                .tabItem {
                    Label("Favorites", image: "star")
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TvShowCell : View {
    let tvshow: TvShowModel
    var body: some View {
        Image(tvshow.image.original)
                .cornerRadius(40)
        VStack(alignment: .center) {
            Text(tvshow.name)
                .font(.title)
            Text(tvshow.summary)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
