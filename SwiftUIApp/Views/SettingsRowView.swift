//
//  SettingsRowView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 18/05/21.
//

import SwiftUI

struct SettingsRowView: View {
  // MARK: - PROPERTIES
  
  var name: String
  var content: String? = nil
  var linkLabel: String? = nil
  var linkDestination: String? = nil

  // MARK: - BODY

  var body: some View {
    VStack {
      Divider().padding(.vertical, 4)
      
      HStack {
        Text(name).foregroundColor(Color.gray)
        Spacer()
        if (content != nil) {
          Text(content!)
        } else {
          EmptyView()
        }
      }
    }
  }
}

// MARK: - PREVIEW

struct SettingsRowView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SettingsRowView(name: "Developer", content: "Luis Zatarain")
        .previewLayout(.fixed(width: 375, height: 70))
        .padding()
    }
  }
}
