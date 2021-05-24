//
//  PlayerControlsView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 21/05/21.
//

import SwiftUI
import AVKit

struct VideoPlayerControlsView : View {
  // MARK: - PROPERTIES
  @Binding var player: AVPlayer
  @Binding var isPlaying : Bool
  @Binding var pannel: Bool
  @Binding var value: Float
    
  // MARK: - BODY
  var body: some View {
    VStack {
        Spacer()
        
        HStack {
            Button(action: {
                self.player.seek(to: CMTime(seconds: self.getSeconds() - 5, preferredTimescale: 1), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
            }) {
                Image(systemName: "backward.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(10)
            }
            
            Spacer()
            
            Button(action: {
                if self.isPlaying {
                    self.player.pause()
                    self.isPlaying = false
                } else if !self.isPlaying && getSliderValue() > 0.99 {
                    self.player.seek(to: CMTime(seconds: 0, preferredTimescale: 1), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
                    self.player.play()
                    self.isPlaying = true
                } else {
                    self.player.play()
                    self.isPlaying = true
                }
                
            }) {
                Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(10)
            }
            
            Spacer()
            
            Button(action: {
                self.player.seek(to: CMTime(seconds: self.getSeconds() + 5, preferredTimescale: 1), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
            }) {
                Image(systemName: "forward.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(10)
            }
            
            Spacer()
            
            CustomProgressBar(value: self.$value, player: self.$player, isPlaying: self.$isPlaying)
            
            Spacer()
        }
        .frame(width: UIScreen.screenWidth, height: 30)
        .background(Color.black.opacity(0.4))
        .onTapGesture {
            self.pannel = false
        }
        .onAppear {
            self.player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main) { (_) in
                self.value = self.getSliderValue()
                
                if self.value == 1.0 {
                    self.isPlaying = false
                }
            }
        }
    }
    
  }
}

extension VideoPlayerControlsView {
    func getSliderValue() -> Float {
        return Float(self.player.currentTime().seconds / (self.player.currentItem?.duration.seconds)!)
    }
    
    func getSeconds() -> Double {
        return Double(Double(self.value) * (self.player.currentItem?.duration.seconds)!)
    }
}
