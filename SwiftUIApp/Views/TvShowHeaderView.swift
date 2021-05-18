//
//  TvShowHeaderView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 18/05/21.
//

import SwiftUI

struct TvShowHeaderView: View {
  // MARK: - PROPERTIES
  
  var tvshow: TvShowModel
  
  @State private var isAnimatingImage: Bool = false

  // MARK: - BODY

  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
      
        NetworkImageView(imageUrl: tvshow.image.original)
        .padding(.vertical, 20)
        .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        
    } //: ZSTACK
    .frame(height: 440)
    .onAppear() {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimatingImage = true
      }
    }
  }
}
