//
//  ForEach+Extension.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 18/05/21.
//

import SwiftUI

/**
 Extension to the ForEach
 
 Summary: This will allow you to use it with any array.
*/
extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
    init(values: Data, content: @escaping (Data.Element) -> Content) {
        self.init(values, id: \.self, content: content)
    }
}
