
//  FQTextEditorView.swift
//  FQSwiftUI

//  Created by TKiOS on 20211217.


import SwiftUI

struct FQTextEditorView: View {
    @State private var content = ""
    @State private var hiddenPlaceholder = false
    let placeholder = Text("请输入描述详情")
    var body: some View {
        Text("TextEditor和之前的UITextView有一个通病，没有placeholder，但是我实现了这个功能，爱咋咋地")
            .font(.body)
            .padding()
        ZStack {
            TextEditor(text: $content)
                .frame(width: 300, height: 100, alignment: .center)
                .border(.cyan)
                .onChange(of: content) { newValue in
                    hiddenPlaceholder = !newValue.isEmpty
                }
            
            if !hiddenPlaceholder {
                placeholder
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 100, alignment: .topLeading).offset(x: 5, y: 8)
            }
        }
        .navigationTitle("TextEditor")
        
    }
}

struct FQTextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FQTextEditorView()
    }
}
