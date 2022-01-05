//
//  FQNavigationLinkView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQNavigationLinkView: View {
    var body: some View {
        VStack {
            NavigationLink {
                //action
                FQNavigationLinkView()
            } label: {
                Text("通过导航的push跳转")
                    .bold()
                    .foregroundColor(.randomColor())
                    .font(.largeTitle)
            }

        }.navigationTitle("NavigationLink")
    }
}

struct FQNavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FQNavigationLinkView()
    }
}
