//
//  ListViewModel.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 14/05/21.
//

import Foundation

/**
 Using old way of fetching information and show it in SwiftUI.
 
 Summary: Fetch the tv shows from the url and send them to the main queue.
*/

final class ListViewModel: ObservableObject {
    init() {
        fetchShows()
    }
   
    @Published var modelList = [TvShowModel]()
   
    private func fetchShows() {
        guard let url = URL(string:"http://api.tvmaze.com/shows") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                    print("error=\(String(describing: error))")
                    return
            }
           
            let modelArray = try! JSONDecoder().decode([TvShowModel].self, from: data)
            DispatchQueue.main.async {
                self.modelList = modelArray
            }
        }.resume()
    }
}

