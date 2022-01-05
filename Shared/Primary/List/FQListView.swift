//
//  FQListView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/16.
//

import SwiftUI

struct FQListView: View {
    var body: some View {
        List {
            Section("样式") {
                NavigationLink {
                    FQListStyleView(listStyle: 0)
                } label: {
                    FQTableViewCell(title: "listStyle：plain", subTitle: nil)
                }
                NavigationLink {
                    FQListStyleView(listStyle: 1)
                } label: {
                    FQTableViewCell(title: "listStyle：grouped", subTitle: nil)
                }
                NavigationLink {
                    FQListStyleView(listStyle: 2)
                } label: {
                    FQTableViewCell(title: "listStyle：sidebar", subTitle: nil)
                }
                NavigationLink {
                    FQListStyleView(listStyle: 3)
                } label: {
                    FQTableViewCell(title: "listStyle：inset", subTitle: nil)
                }
                NavigationLink {
                    FQListStyleView(listStyle: 4)
                } label: {
                    FQTableViewCell(title: "listStyle：insetGrouped", subTitle: nil)
                }
                NavigationLink {
                    FQListStyleView(listStyle: 10)
                } label: {
                    FQTableViewCell(title: "listStyle：automatic", subTitle: nil)
                }
            }
            Section("编辑") {
                NavigationLink {
                    FQListEditView()
                } label: {
                    FQTableViewCell(title: "EditList", subTitle: "移动删除Cell")
                }
            }
        }
        .navigationTitle("ListView")
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        FQListView()
    }
}
