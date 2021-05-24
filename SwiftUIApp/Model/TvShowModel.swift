//
//  TvShowModel.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 14/05/21.
//

import Foundation
/**
 Tv Shows Model
 
 Summary: We took the variables we needed from the json and made it possible to conform to different protocols to facilitate their use.
*/
struct TvShowModel: Codable, Equatable, Hashable, Identifiable {
    // MARK: - PROPERTIES
    var id: Int
    var url: String
    var name, language: String
    var genres: [String]
    var status: String
    var runtime: Int?
    var premiered: String
    var image: Images
    var summary: String
    
    init(id: Int = 0, url: String = "", name: String = "", language: String = "", genres: [String] =  [""], status: String = "", runtime: Int? = 0, premiered: String = "", image: Images, summary: String = ""){
            
        self.id = id
        self.url = url
        self.name = name
        self.language = language
        self.genres = genres
        self.status = status
        self.runtime = runtime
        self.premiered = premiered
        self.image = image
        self.summary = summary
    }
    
    static func == (left: TvShowModel, right: TvShowModel) -> Bool {
       return left.id == right.id
    }
}

struct Images: Codable, Hashable {
    let medium, original: String
}
