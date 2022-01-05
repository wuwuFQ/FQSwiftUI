//
//  FQGeometryReaderView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/23.
//

import SwiftUI

struct FQGeometryReaderView: View {
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Divider()
                    RoundedRectangle(cornerRadius: 20).foregroundColor(.red).frame(width: 300, height: 400)
                    RoundedRectangle(cornerRadius: 20).foregroundColor(.yellow).frame(width: 300, height: 400)
                    Divider()
                }
                
                GeometryReader { geometry in
                    VStack(alignment: .leading, spacing: 20, content: {
                        
                        Text("绿色ScrollView width: \(geometry.size.width)")
                        Text("绿色ScrollView height: \(geometry.size.height)")
                        Text("绿色ScrollView X : \(geometry.frame(in: .global).origin.x)")
                        Text("绿色ScrollView Y: \(geometry.frame(in: .global).origin.y)")
                    })
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.orange)).padding()
                }
            }
            
        }
        .background(.green)
        .navigationTitle("获取父布局信息")
    }
}

struct FQGeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        FQGeometryReaderView()
    }
}
