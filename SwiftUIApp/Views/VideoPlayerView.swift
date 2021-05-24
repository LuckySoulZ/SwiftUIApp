//
//  VideoPlayerView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 20/05/21.
//

import SwiftUI
import AVKit

/**
    Simple implementation of Video Player
     
    Summary: Use of AVKit and player.
*/
struct VideoPlayerView: View {
  // MARK: - PROPERTIES
  
  var videoSelected: String
  var videoTitle: String
    
  // MARK: - BODY

  var body: some View {
    VStack {
      VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
      .overlay(
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .padding(.top, 6)
          .padding(.horizontal, 8)
        , alignment: .topLeading
      )
    }
    .accentColor(.accentColor)
    .navigationBarTitle(videoTitle, displayMode: .inline)
  }
}

// MARK: - PREVIEW

struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
  }
}

extension VideoPlayerView {
    func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
        var videoPlayer = AVPlayer()
        
      if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer.play()
      }
        return videoPlayer
    }
}
