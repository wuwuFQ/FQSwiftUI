//
//  FQNavigationView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQNavigationView: View {
    var body: some View {
        NavigationView {
            Text("一个导航包裹的视图，可定义导航按钮")
                .bold()
                .foregroundColor(.randomColor())
                .font(.largeTitle)
        }
        .navigationTitle("NavigationView")
        .navigationBarItems(trailing: Button(action: {
            print("Tap")
        }, label: {
            Text("Right").foregroundColor(.red)
        }))
        
    }
}

struct FQNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        FQNavigationView()
    }
}
