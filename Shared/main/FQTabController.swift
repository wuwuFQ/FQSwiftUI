//
//  FQTabController.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/22.
//

import SwiftUI

struct FQTabController: View {
    private let tabBar = TabBarState()
    @State private var selection = 0
    init() {
        UITabBar.appearance().unselectedItemTintColor = .black
        UINavigationBar.appearance().tintColor = .black
    }
    var body: some View {
        
            
            TabView(selection: $selection, content: {
                NavigationView {
                    FQPrimaryView().environmentObject(tabBar)
                }
                    .tabItem {
                        if selection == 0 {
                            Image("tab01_select")
                            Text("基础")
                        } else {
                            Image("tab01")
                            Text("基础")
                        }
                    }.tag(0)
                NavigationView {
                FQAdvanceView().environmentObject(tabBar)
                }
                    .tabItem {
                        if selection == 1 {
                            Image("tab02_select")
                            Text("进阶")
                        } else {
                            Image("tab02")
                            Text("进阶")
                        }
                    }.tag(1)
                NavigationView {
                FQMineView().environmentObject(tabBar)
                }
                    .tabItem {
                        if selection == 2 {
                            Image("tab03_select")
                            Text("我的")
                        } else {
                            Image("tab03")
                            Text("我的")
                        }
                    }.tag(2)
            }).tint(.accentColor)
            
           
        
    }
    
}


class TabBarState: ObservableObject {
   @Published var hidden : Bool = false
}

struct FQTabController_Previews: PreviewProvider {
    static var previews: some View {
        FQTabController()
    }
}
