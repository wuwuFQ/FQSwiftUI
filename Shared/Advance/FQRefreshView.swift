//
//  FQRefreshView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/28.
//

import SwiftUI

struct FQRefreshView: View {
    @State var listData: [ListData.SectionData] = [
           ListData.SectionData(index: 0, title: "Holle Word", subTitle: "你好 世界"),
           ListData.SectionData(index: 0, title: "Holle Word", subTitle: "你好 世界"),
           ListData.SectionData(index: 0, title: "Holle Word", subTitle: "你好 世界"),
           ListData.SectionData(index: 0, title: "Holle Word", subTitle: "你好 世界"),
       ]
    
       var body: some View {
           List {
               ForEach(listData) { item in
                   FQTableViewCell(title: item.title, subTitle: item.subTitle)
               }
           }.refreshable(action: {
//               await
               listData.append(ListData.SectionData(index: 0, title: "新增", subTitle: "append"))
            })
               
               .navigationTitle("refreshable")
       }

   }

struct FQRefreshView_Previews: PreviewProvider {
    static var previews: some View {
        FQRefreshView()
    }
}
