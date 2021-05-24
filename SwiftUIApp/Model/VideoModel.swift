//
//  VideoModel.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 21/05/21.
//

import Foundation

struct Video: Codable, Identifiable {
  // MARK: - PROPERTIES
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}
