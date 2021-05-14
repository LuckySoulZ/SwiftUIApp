//
//  TextView.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 14/05/21.
//

import SwiftUI

/**
 Custom Text View
 
 Summary: This text view allows the text to be justified while the current views don't allow you to do this.
*/
struct TextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
