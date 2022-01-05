//
//  FQListEditView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/16.
//

import SwiftUI
struct FQListEditModel: Identifiable {
    var id = UUID()
    let name: String
}
struct FQListEditView: View {
    @State var names: [FQListEditModel] = [
        FQListEditModel(name: "Object-C"),
        FQListEditModel(name: "Swift"),
        FQListEditModel(name: "Flutter"),
        FQListEditModel(name: "Java"),
        FQListEditModel(name: "PHP"),
        FQListEditModel(name: "Python"),
        FQListEditModel(name: "Go"),
        FQListEditModel(name: "C"),
        FQListEditModel(name: "Android"),
        FQListEditModel(name: "蒙奇·D·路飞"),
        FQListEditModel(name: "罗罗诺亚·索隆"),
        FQListEditModel(name: "山治"),
        FQListEditModel(name: "乌索普"),
        FQListEditModel(name: "娜美"),
        FQListEditModel(name: "托尼托尼·乔巴"),
        FQListEditModel(name: "妮可·罗宾"),
        FQListEditModel(name: "弗兰奇"),
        FQListEditModel(name: "布鲁克"),
        FQListEditModel(name: "甚平"),]
    var body: some View {
        List {
            Text("禁止编辑的Cell").accessibilityHidden(true)
            ForEach(names) {item in
                Text(item.name)
            }
            .onDelete { indexSet in
                if let first = indexSet.first { //获得索引集合里的第一个元素，然后从数组里删除对应索引的元素
                    names.remove(at: first)
                }
            }
            .onMove { indexSet, index in
                names.move(fromOffsets: indexSet, toOffset: index)
            }
        }.navigationTitle("编辑ListCell")

            .navigationBarItems(trailing: EditButton())
    }
}

struct ListEditView_Previews: PreviewProvider {
    static var previews: some View {
        FQListEditView()
    }
}
