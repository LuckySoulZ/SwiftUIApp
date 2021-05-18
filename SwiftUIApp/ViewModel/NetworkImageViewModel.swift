//
//  NEW.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 14/05/21.
//

import SwiftUI
import Combine
import Foundation

/**
 New way of fetching information and show it using SwiftUI.
 
 Summary: Fetch the tv shows image data from the url and send them to the main queue.
*/
struct NetworkImageView: View {
    @ObservedObject var remoteImageURL: RemoteImageURL

    init(imageUrl: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageUrl)
    }

    var body: some View {
        Image(uiImage: UIImage(data: remoteImageURL.data) ?? UIImage())
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
    }
}

class RemoteImageURL: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    @Published var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }

            DispatchQueue.main.async { self.data = data }

        }.resume()
    }
}
