//
//  RichTextEditor.swift
//  RichEditView-SwiftUI
//
//  Created by Tadeh Alexani on 6/23/21.
//

import SwiftUI
import RichEditorView

struct RichTextEditor: UIViewRepresentable {
  
  class Coordinator: RichEditorDelegate {
    
    var parent: RichTextEditor
    
    init(_ parent: RichTextEditor) {
      self.parent = parent
    }
    
    func richEditorTookFocus(_ editor: RichEditorView) {
      parent.isEditingRichText = true
    }
    func richEditorLostFocus(_ editor: RichEditorView) {
      parent.isEditingRichText = false
    }
    
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  @Binding var htmlText: String
  @Binding var isEditingRichText: Bool
  
  func makeUIView(context: Context) -> RichEditorView {
    let editor = RichEditorView(frame: .zero)
    editor.html = htmlText
    editor.isScrollEnabled = false
    editor.delegate = context.coordinator
    
    let toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
    toolbar.options = RichEditorDefaultOption.all
    toolbar.editor = editor
    
    editor.inputAccessoryView = toolbar
    
    return editor
  }
  
  func updateUIView(_ uiView: RichEditorView, context: Context) {
  }
}
