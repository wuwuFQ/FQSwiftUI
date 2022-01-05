//
//  FQViewModifierView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/24.
//

import SwiftUI

struct FQViewModifierView: View {
    var body: some View {
        ScrollView {
            Text("自定义一个ViewModifier，快速修改一个image圆角阴影等")
                .foregroundColor(.pink)
                .font(.headline)
                .modifier(FQPaddingViewModifier())
            Image("image02").modifier(FQImageStyleViewModifier())
            
            Image("image01").modifier(FQImageStyleViewModifier()).modifier(FQPaddingViewModifier())
            
            Image("image03").modifier(FQImageStyleViewModifier())
            
        }.navigationTitle("ViewModifier")
    }
}
private struct FQPaddingViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(30)
    }
}
private struct FQImageStyleViewModifier: ViewModifier {
   
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .saturation(0.3)
            .shadow(color: .pink, radius: 8)
            

    }
}
struct FQViewModifierView_Previews: PreviewProvider {
    static var previews: some View {
        FQViewModifierView()
    }
}
