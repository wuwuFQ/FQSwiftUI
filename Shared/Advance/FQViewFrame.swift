//
//  FQViewFrame.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/17.
//

import SwiftUI

struct FQViewFrame: View {
    // 通过PreferenceKey能让父view拿到子view包装的信息
    private struct SizeKey: PreferenceKey {
        static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
            value = value ?? nextValue()
        }
    }
    @State private var layoutSize: CGSize?
    
    var body: some View {
        VStack {
            Text("一个自适应的文本：张三")
                .font(.title2)
                .foregroundColor(.green)
                .border(.green)
                .background {
                    GeometryReader { proxy in
                        // 将Text的尺寸传递给了父布局
                        Color.clear.preference(key: SizeKey.self, value: proxy.size)
                    }
                }
            
            Text("无论这个文本有多长，有多嚣张，都得跟 张三 的宽高一样！")
                .frame(width: layoutSize?.width, height: layoutSize?.height)
                .font(.title2)
                .foregroundColor(.red)
                .border(.red)
            Text("无论这个文本有多长，有多嚣张，都得跟 张三 的宽高一样！")
        }.onPreferenceChange(SizeKey.self) { size in
            layoutSize = size
        }
        .border(.pink)
        .navigationTitle("获取布局的Size")
        
        
    }
}

struct FQViewFrame_Previews: PreviewProvider {
    static var previews: some View {
        FQViewFrame()
    }
}
