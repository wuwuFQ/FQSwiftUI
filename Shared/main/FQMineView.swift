//
//  FQMineView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/22.
//

import SwiftUI

struct FQMineView: View {
    @EnvironmentObject var tabBar: TabBarState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarTitle("FQSwiftUI")
            .onAppear {
                self.tabBar.hidden = false
            }
    }
}

struct FQMineView_Previews: PreviewProvider {
    static var previews: some View {
        FQMineView()
    }
}
