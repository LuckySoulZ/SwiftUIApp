//
//  String+Extension.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 14/05/21.
//

/**
 Removing Html Tags.
 
 Summary: Remove tags like <p> <b> etc from a string.
*/
extension String {
    var html2AttributedString: String {
        let str = self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return str
    }
}
