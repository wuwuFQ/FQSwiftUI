//
//  FQListStyleView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/16.
//

import SwiftUI

struct FQListStyleView: View {
    var listStyle: Int = 0
    var body: some View {
        switch listStyle {
        case 0:
            List {
                ForEach.init(0..<10) {index in
                    FQTableViewCell(title: "\(index)--listStyle is PlainListStyle", subTitle: nil)
                }
            }.listStyle(.plain).navigationTitle("List样式")
        case 1:
            List {
                ForEach.init(0..<10) {index in
                    FQTableViewCell(title: "\(index)--listStyle is GroupedListStyle", subTitle: nil)
                }
            }.listStyle(.grouped).navigationTitle("List样式")
        case 2:
            List {
                ForEach.init(0..<10) {index in
                    FQTableViewCell(title: "\(index)--listStyle is SidebarListStyle", subTitle: nil)
                }
            }.listStyle(.sidebar).navigationTitle("List样式")
        case 3:
            List {
                ForEach.init(0..<10) {index in
                    FQTableViewCell(title: "\(index)--listStyle is InsetListStyle", subTitle: nil)
                }
            }.listStyle(.inset).navigationTitle("List样式")
        case 4:
            List {
                ForEach.init(0..<10) {index in
                    FQTableViewCell(title: "\(index)--listStyle is InsetGroupedListStyle", subTitle: nil)
                }
            }.listStyle(.insetGrouped).navigationTitle("List样式")
        default:
            List {
                ForEach.init(0..<10) {index in
                    FQTableViewCell(title: "\(index)--listStyle is DefaultListStyle", subTitle: nil)
                }
                Section("隐藏下划线") {
                    ForEach.init(0..<10) {index in
                        FQTableViewCell(title: "\(index)--listStyle is DefaultListStyle", subTitle: nil).listRowSeparator(.hidden)
                    }
                }
            }.listStyle(.automatic).navigationTitle("List样式")
        }
           
    }
}

struct ListGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FQListStyleView()
    }
}
