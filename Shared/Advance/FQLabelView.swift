//
//  FQLabelView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/28.
//

import SwiftUI

struct FQLabelView: View {
    var body: some View {
        let trapezoid = Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: 90, y: 0))
            path.addLine(to: CGPoint(x: 80, y: 50))
            path.addLine(to: CGPoint(x: 10, y: 50))
        }
        ZStack {
            Color.teal
            Label("Flag", systemImage: "flag.fill")
                .padding()
                .background(in: trapezoid)
        }.frame(width: 130, height: 100, alignment: .center)
        .navigationTitle("Label")
    }
}

struct FQLabelView_Previews: PreviewProvider {
    static var previews: some View {
        FQLabelView()
    }
}
