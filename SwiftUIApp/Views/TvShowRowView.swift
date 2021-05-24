//
//  TvShowRowView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 18/05/21.
//

import SwiftUI

struct TvShowRowView: View {
  // MARK: - PROPERTIES
  var tvshow: TvShowModel
  @AppStorage("isLightMode") var isLightMode: Bool = false
    
  // MARK: - BODY

  var body: some View {
    ZStack {
        if isLightMode {
            Color.white
                .ignoresSafeArea()
        } else {
            Color.black
                .ignoresSafeArea()
        }

        HStack {
            NetworkImageView(imageUrl: tvshow.image.medium)
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
      
            VStack(alignment: .leading, spacing: 5) {
                Text(tvshow.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
        
                if isLightMode {
                    Text(tvshow.summary.html2AttributedString)
                        .font(.subheadline)
                        .lineLimit(3)
                        .foregroundColor(.black)
                    Text("Genres: \(tvshow.genres.joined(separator: ","))")
                        .font(.subheadline)
                        .foregroundColor(.black)
                } else {
                    Text(tvshow.summary.html2AttributedString)
                        .font(.subheadline)
                        .lineLimit(3)
                        .foregroundColor(.white)
                    Text("Genres: \(tvshow.genres.joined(separator: ","))")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
        } 
    }
  }
}
