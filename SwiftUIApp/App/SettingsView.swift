//
//  SettingsView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 18/05/21.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.presentationMode) var presentationMode
  @AppStorage("isDarkMode") var isDarkMode: Bool = false
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          // MARK: - SECTION 1
          
          GroupBox(
            label:
              SettingsLabelView(labelText: "TvShows", labelImage: "info.circle")
          ) {
            Divider().padding(.vertical, 4)
            
            VStack(alignment: .center, spacing: 10) {
              Image("arkus-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 60)
                .cornerRadius(9)
              
              Text("Most of the Tv Shows App.")
                .font(.body)
                .multilineTextAlignment(.leading)
            }
          }
          
          // MARK: - SECTION 2
          
          GroupBox(
            label: SettingsLabelView(labelText: "Settings Options", labelImage: "paintbrush")
          ) {
            Divider().padding(.vertical, 4)
            
            Text("Do you wish to change to dark mode?.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)
            
            Toggle(isOn: $isDarkMode) {
              if isDarkMode {
                Text("Dark Mode On".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(Color.green)
              } else {
                Text("Dark Mode Off".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(Color.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
          }
          
          // MARK: - SECTION 3
          
          GroupBox(
            label:
            SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
          ) {
            SettingsRowView(name: "Developer", content: "Luis Zatarain")
            SettingsRowView(name: "Compatibility", content: "iOS 14")
            SettingsRowView(name: "SwiftUI", content: "2.0")
          }
          
        }
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(
          trailing:
            Button(action: {
              presentationMode.wrappedValue.dismiss()
            }) {
              Image(systemName: "xmark")
            }
        )
        .padding()
      }
    }
  }
}
