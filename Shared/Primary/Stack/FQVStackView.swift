//
//  FQVStackView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQVStackView: View {
    var body: some View {
        VStack {
            Text("我").foregroundColor(.randomColor())
            Text("和").foregroundColor(.randomColor())
            Text("祖").foregroundColor(.randomColor())
            Text("国").foregroundColor(.randomColor())
            Divider().background(Color.randomColor())
            Text("永").foregroundColor(.randomColor())
            Text("不").foregroundColor(.randomColor())
            Text("分").foregroundColor(.randomColor())
            Text("割").foregroundColor(.randomColor())
        }
        .navigationTitle("VStack")
    }
}

struct VStackView_Previews: PreviewProvider {
    static var previews: some View {
        FQVStackView()
    }
}
