//
//  Bundle+Extension.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 21/05/21.
//

import Foundation
/**
Bundle Extension to decode internal json
 
 Summary: We locate json file, create data from it, decode and transform the decoded data.
*/
extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }
    
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }
    
    let decoder = JSONDecoder()
    
    guard let decoded = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle.")
    }
    
    return decoded
  }
}
