//
//  FQTabView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQTabView: View {
    @State private var show = true

    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            TabItemPage(index: 0)
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("one")
                }.tag(0)
            TabItemPage(index: 1)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("two")
                }.tag(1)
                .badge(3)
            TabItemPage(index: 2)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("three")
                }.tag(2)
        }.background(.orange)
        .accentColor(.red)
            .navigationTitle("TabView")
    }
}
fileprivate struct TabItemPage: View {
    
    var index: Int
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.randomColor())
            VStack {
                Text("\(index)")
                    .foregroundColor(.white)
                    .font(.system(size: 100, design: .rounded))
                    .bold()
                Image("image03")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200,height: 200)
            }
        }
    }
}

struct FQTabView_Previews: PreviewProvider {
    static var previews: some View {
        FQTabView()
    }
}
