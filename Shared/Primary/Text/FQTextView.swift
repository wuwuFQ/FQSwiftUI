//
//  FQTextView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/16.
//

import SwiftUI

struct FQTextView: View {

    var body: some View {
        VStack {
            HStack {
                
                Text("他强任他强\n清风拂山岗")
                // 删除线
                    .strikethrough(true, color: Color.black)
                // 下划线
                    .underline(true, color: .yellow)
                // 每行底部偏移..也可以作为另一种行间距使用..
                    .baselineOffset(50)
                // 字体大小
                    .font(.largeTitle)
                // 粗体
                    .fontWeight(.bold)
                // 斜体
    //                .italic()
                // 字间距
                    .kerning(10)
                // 行间距
                    .lineSpacing(10)
                // 字体颜色
                    .foregroundColor(Color.white)
                // 最大行数, 如不设置, 则表示无限行
                    .lineLimit(2)
                // 内间距
                    .padding()
                // 背景颜色
                    .background(Color.red)
                // 圆角
                    .cornerRadius(20)
                // 添加点击手势
                    .onTapGesture {
                        print("点击1")
                    }
                // 添加长按手势
                    .onLongPressGesture(minimumDuration: 2, maximumDistance: 4, pressing: { (result) in
                        print("\(result ? "开始按压" : "按压结束")")
                    }) {
                        print("触发长按")
                    }
                // 添加其他手势
                    .gesture(
                        // 比如这里添加一个拖动手势
                        DragGesture()
                        // 拖动改变了
                            .onChanged({ (value) in
                                print(value)
                            })
                        // 拖动结束
                            .onEnded({ (value) in
                                print(value)
                            })
                    )
                    .shadow(color: Color.purple, radius: 20)

                
            }

            
            Text("他横任他横，明月照大江")
                .font(.largeTitle)
            

                .shadow(color: Color.red, radius: 5)
                 Text("--by William Shakespeare")
                     .font(.system(size: 20, weight: .light, design: .serif))
                     .italic()
                     .blur(radius: 2.0)
        }.onAppear(perform: {
            FQUtil.tabBarHidden(hidden: true)
        })
        
        .navigationTitle("Text")
        

    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        FQTextView()
    }
}
