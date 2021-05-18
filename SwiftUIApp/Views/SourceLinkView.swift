//
//  SourceLinkView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 18/05/21.
//

import SwiftUI

struct SourceLinkView: View {

// MARK: - BODY
  var body: some View {
      HStack {
        Text("Content source")
        Spacer()
        Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
        Image(systemName: "arrow.up.right.square")
      }
      .font(.footnote)
  }
}

struct SourceLinkView_Previews: PreviewProvider {
    // MARK: - PREVIEW
  static var previews: some View {
    SourceLinkView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
