//
//  VideoListView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 20/05/21.
//
import SwiftUI
import AVKit

struct VideoListView: View {
  // MARK: - PROPERTIES
  
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

  // MARK: - BODY

  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          
          /* Two ways to use video player, using AVPlayer easy or customized controls on the player */
          NavigationLink(destination: CustomVideoPlayerView(player: playVideo(fileName: item.id, fileFormat: "mp4"), videoTitle: item.name)) {
          //NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        }
      }
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            // Shuffle videos
            videos.shuffle()
            hapticImpact.impactOccurred()
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    }
  }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
      .previewDevice("iPhone 12 Pro")
  }
}

extension VideoListView {
    func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
      var avPlayer = AVPlayer()
      if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        avPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
      }
      return avPlayer
    }
}
