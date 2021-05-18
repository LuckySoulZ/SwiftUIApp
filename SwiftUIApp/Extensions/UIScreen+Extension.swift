//
//  UIScreen+Extension.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 14/05/21.
//

import SwiftUI

/**
 Extension to the UIScreen
 
 Summary: Get more easily the screen width and height to make use of it when creating the views based on them.
*/
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
