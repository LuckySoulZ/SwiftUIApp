//
//  TvShowDetails.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 18/05/21.
//

import SwiftUI

struct TvShowDetailView: View {
  // MARK: - PROPERTIES
  
  var tvshow: TvShowModel

  // MARK: - BODY
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          TvShowHeaderView(tvshow: tvshow)
          
          VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .center, spacing: 20) {
                Text(tvshow.name)
                  .font(.largeTitle)
                  .fontWeight(.heavy)
                
                VStack {
                    Text("Date Released")
                    Text(tvshow.premiered)
                        .font(.headline)
                }
            }
            
            Text("Genres: \(tvshow.genres.joined(separator: ","))")
              .font(.subheadline)
            
            TextView(text: tvshow.summary.html2AttributedString)
                .frame(width: UIScreen.screenWidth - 60, height: 300)
            
            HStack(alignment: .center, spacing: 20) {
                Text("TvMaze Link for " + tvshow.name)
                  .font(.subheadline)
                Link("Link", destination: URL(string:tvshow.url)!)
            }
            .padding(10)
        }
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, alignment: .center)
        }
        .navigationBarTitle(tvshow.name, displayMode: .inline)
        .navigationBarHidden(true)
      }
      .edgesIgnoringSafeArea(.top)
    } 
    .navigationViewStyle(StackNavigationViewStyle())
  }
}
