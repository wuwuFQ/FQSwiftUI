//
//  FQDisclosureGroupView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/24.
//

import SwiftUI
private struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch children {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}
struct FQDisclosureGroupView: View {
    private  let data =
    FileItem(name: "users", children:
                [FileItem(name: "user1234", children:
                            [FileItem(name: "Photos", children:
                                        [FileItem(name: "photo001.jpg"),
                                         FileItem(name: "photo002.jpg")]),
                             FileItem(name: "Movies", children:
                                        [FileItem(name: "movie001.mp4")]),
                             FileItem(name: "Documents", children: [])
                            ]),
                 FileItem(name: "newuser", children:
                            [FileItem(name: "Develop", children: [])
                            ])
                ])
    @State private var topExpanded: Bool = true
    var body: some View {
        ScrollView {
            Button {
                topExpanded.toggle()
            } label: {
                Text("展开/收起")
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.red).frame(width: 100, height: 40, alignment: .center))
                
            }.padding(.bottom, 30)
            
           
            DisclosureGroup("北京市", isExpanded: $topExpanded) {
                DisclosureGroup("昌平区") {
                    Text("南邵镇")
                    Text("沙河镇")
                    Text("北七家镇")
                    Text("小汤山镇")
                }.padding(.leading, 30)
                DisclosureGroup("海淀区") {
                    Text("上地")
                    Text("西二旗")
                    Text("中关村")
                    Text("清河")
                }.padding(.leading, 30)
                
            }.frame(minWidth: 50, idealWidth: 60, maxWidth: 200, minHeight: 20, idealHeight: 30, maxHeight: 50, alignment: .trailing)
            
            Divider()
            Text("第二种树状结构").padding(30)
            
            OutlineGroup(data, children: \.children) { item in
                Text("\(item.description)").frame(width: 200, height: 40, alignment: .center)
                
            }
        }.navigationTitle("DisclosureGroup")
    }
    
}
struct FQDisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FQDisclosureGroupView()
    }
}
