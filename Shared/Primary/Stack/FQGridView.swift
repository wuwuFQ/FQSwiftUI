//
//  FQGridView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQGridView: View {
    var columns: [GridItem] =
    Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        ScrollView {
            //竖向排列 columns横向列数
            LazyVGrid(columns: columns) {
                ForEach((0...79), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)")
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                }
            }.font(.largeTitle)
        }.navigationTitle("Grid")
    }
}

struct FQGridView_Previews: PreviewProvider {
    static var previews: some View {
        FQGridView()
    }
}
