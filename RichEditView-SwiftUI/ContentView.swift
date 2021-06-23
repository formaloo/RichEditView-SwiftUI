//
//  ContentView.swift
//  RichEditView-SwiftUI
//
//  Created by Tadeh Alexani on 6/23/21.
//

import SwiftUI

struct ContentView: View {
  
  @State private var htmlText = "<html><body><p>This is <i>some </i>description!</p>\n<br>\n</body></html>"
  @State private var isEditingRichText = false
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      
      if isEditingRichText {
        Text("Is editing...")
      } else {
        Text("Not editing...")
      }
      
      RichTextEditor(htmlText: $htmlText, isEditingRichText: $isEditingRichText)
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 5)
            .stroke(lineWidth: 1)
        )
        .frame(height: 80)
      
    }
    .padding()
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
