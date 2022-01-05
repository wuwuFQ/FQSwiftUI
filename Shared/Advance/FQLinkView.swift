//
//  FQLinkView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/24.
//

import SwiftUI

struct FQLinkView: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        Link("淘宝", destination: URL(string: "https://taobao.com")!).foregroundColor(.red).padding()
        Link("apple", destination: URL(string: "https://www.apple.com")!).foregroundColor(.blue).padding()
            
        Button(action: contactSupport) {
            Text("openURL 打开 apple")
            Image(systemName: "envelope.open")
        }
        
        .navigationTitle("Link")
        
    }
    func contactSupport() {
        guard let url = URL(string: "https://www.apple.com") else {
            return
        }
        openURL(url)
    }
}

struct FQLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FQLinkView()
    }
}
