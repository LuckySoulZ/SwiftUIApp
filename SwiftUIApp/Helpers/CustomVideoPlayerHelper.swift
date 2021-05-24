//
//  VideoPlayer.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 21/05/21.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer : UIViewControllerRepresentable {
    // MARK: - PROPERTIES
    @Binding var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resize
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
    
}
