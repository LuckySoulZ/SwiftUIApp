//
//  File2.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 20/05/21.
//

import SwiftUI

struct CoverListView: View {
  // MARK: - PROPERTIES
  
  let coverModel: [TvShowModel]
  
  // MARK: - BODY
  
  var body: some View {
    TabView {
        ForEach(coverModel) { item in
            NetworkImageView(imageUrl: item.image.medium)
                .frame(width: 300, height: 300, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
        }
    }
    .tabViewStyle(PageTabViewStyle())
  }
}
