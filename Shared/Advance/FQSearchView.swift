//
//  FQSearchView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/28.
//

import SwiftUI

struct FQSearchView: View {
    @State private var text = ""
    var body: some View {
        Text(text)
            .searchable(text: $text, placement: .automatic, prompt: "请输入搜索关键字")
            .navigationTitle("searchable")
    }
}

struct FQSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FQSearchView()
    }
}
