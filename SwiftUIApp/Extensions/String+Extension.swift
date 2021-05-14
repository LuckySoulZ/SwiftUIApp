//
//  String+Extension.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 14/05/21.
//

extension String {
    var html2AttributedString: String {
        let str = self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return str
    }
}
