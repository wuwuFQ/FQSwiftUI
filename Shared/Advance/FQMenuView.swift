//
//  FQMenuView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/24.
//

import SwiftUI

struct FQMenuView: View {
    var body: some View {
        Menu("Menu") {
            Button("可乐鸡翅"){}
            Button("红烧肉"){}
            Button("重庆火锅"){}
            Button("地三鲜"){}
            Button("香辣肉丝"){}
            Button("锅包肉"){}
            Menu("东北菜") {
                Button("铁锅炖大鹅"){}
                Button("小鸡炖蘑菇"){}
                Button("东北乱炖"){}
            }
        }.padding()
        
        Text("来，按住我，使劲！")
                 .padding()
                 .contextMenu {
                     Button("轻点"){}
                     Button("别按坏了"){}
                     Button("松手啊"){}

                 }
                 .navigationTitle("菜单列表")
    }
}

struct FQMenuView_Previews: PreviewProvider {
    static var previews: some View {
        FQMenuView()
    }
}
