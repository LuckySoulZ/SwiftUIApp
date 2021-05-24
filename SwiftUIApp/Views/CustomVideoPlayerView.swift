//
//  CustomVideoPlayerView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 21/05/21.
//

import SwiftUI
import AVKit

/**
    Custom implementation of Video Player
     
    Summary: Use of AVKit, Custom Controls and Functionality.
*/
struct CustomVideoPlayerView : View {
  // MARK: - PROPERTIES
  @State var player: AVPlayer
  @State var isPlaying = false
  @State var showcontrols = false
  @State var value: Float = 0
  var videoTitle: String
    
  // MARK: - BODY
  var body: some View {
    VStack {
        ZStack {
            CustomVideoPlayer(player: $player)
            
            if self.showcontrols {
                VideoPlayerControlsView(player: $player, isPlaying: self.$isPlaying, pannel: self.$showcontrols, value: self.$value)
            }
        }
        .frame(height: UIScreen.screenHeight/3)
        .onTapGesture {
            self.showcontrols = true
        }
    }
    .background(Color.black.edgesIgnoringSafeArea(.all))
    .navigationBarTitle(videoTitle, displayMode: .inline)
    .onAppear {
        self.player.seek(to: CMTime(seconds: 0, preferredTimescale: 1), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        self.player.play()
        self.isPlaying = true
    }
  }
}
